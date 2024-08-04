import 'dart:async'; // Importa la biblioteca para el temporizador
import 'dart:developer';
import 'package:curiosity_eye_app/models/recognized_object_model.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tflite_v2/tflite_v2.dart';

import '../../../services/gemini_service.dart'; // Importa el servicio Gemini
import '../../../widgets/AppScaffold/app_scaffold.dart';

class ObjectDetectionScreen extends ConsumerStatefulWidget {
  final List<CameraDescription> cameras;

  const ObjectDetectionScreen({super.key, required this.cameras});

  @override
  _ObjectDetectionScreenState createState() => _ObjectDetectionScreenState();
}

class _ObjectDetectionScreenState extends ConsumerState<ObjectDetectionScreen> {
  late CameraController _controller;
  bool isModelLoaded = false;
  List<RecognizedObject>? recognitions;
  int imageHeight = 0;
  int imageWidth = 0;
  Timer? _timer;
  String curiousFact = '';
  bool _isProcessing = false;
  List<String> alreadyGivenFacts = [];
  DateTime? _lastFactRequestTime;

  @override
  void initState() {
    super.initState();
    loadModel();
    initializeCamera(null);
    startRecognitionTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> loadModel() async {
    try {
      String? res = await Tflite.loadModel(
        model: 'lib/assets/ml_models/ssd_mobilenet_v2/detect.tflite',
        labels: 'lib/assets/ml_models/ssd_mobilenet_v2/labelmap.txt',
      );

      if (res == null) {
        print('///Model loaded///');
      } else {
        print('///Error loading model: $res///');
      }
      setState(() {
        isModelLoaded = res != null;
      });
    } catch (e) {
      setState(() {
        isModelLoaded = false;
      });
      print('Error loading model: $e');
    }
  }

  void toggleCamera() {
    final lensDirection = _controller.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = widget.cameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    } else {
      newDescription = widget.cameras.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    }

    if (newDescription != null) {
      initializeCamera(newDescription);
    } else {
      print('Asked camera not available');
    }
  }

  void initializeCamera(description) async {
    if (description == null) {
      _controller = CameraController(
        widget.cameras[0],
        ResolutionPreset.high,
        enableAudio: false,
      );
    } else {
      _controller = CameraController(
        description,
        ResolutionPreset.high,
        enableAudio: false,
      );
    }

    await _controller.initialize();

    if (!mounted) {
      return;
    }
    _controller.startImageStream((CameraImage image) {
      if (isModelLoaded && !_isProcessing) {
        runModel(image);
      }
    });
    setState(() {});
    getFact(); // Llamada inmediata para obtener la primera curiosidad
  }

  void runModel(CameraImage image) async {
    if (image.planes.isEmpty) return;

    try {
      setState(() {
        _isProcessing = true;
      });

      List<dynamic>? _recognitions = await Tflite.detectObjectOnFrame(
        bytesList: image.planes.map((plane) => plane.bytes).toList(),
        model: 'SSDMobileNet',
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5,
        imageStd: 127.5,
        numResultsPerClass: 1,
        threshold: 0.4,
      );

      List<RecognizedObject>? listOfRecognizedObjects =
          _recognitions?.map<RecognizedObject>((rec) {
        return RecognizedObject.fromMap(rec);
      }).toList();

      /// Get a first fast fact about the most confident object
      if (curiousFact.isEmpty) {
        RecognizedObject? mostConfidentObject = listOfRecognizedObjects
            ?.reduce((a, b) => a.confidence > b.confidence ? a : b);
        curiousFact =
            await getFactAboutObject(mostConfidentObject!.detectedClass) ?? '';
      }

      setState(() {
        recognitions = listOfRecognizedObjects;
        imageHeight = image.height;
        imageWidth = image.width;
        _isProcessing = false;
      });
    } catch (e) {
      setState(() {
        _isProcessing = false;
      });
      print('Error: $e');
    }
  }

  void startRecognitionTimer() {
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) async {
      getFact();
    });
  }

  void getFact() async {
    if (recognitions != null && recognitions!.isNotEmpty) {
      RecognizedObject mostConfidentObject =
          recognitions!.reduce((a, b) => a.confidence > b.confidence ? a : b);

      // Guard clause to prevent multiple calls within 10 seconds
      if (_lastFactRequestTime != null &&
          DateTime.now().difference(_lastFactRequestTime!).inSeconds < 10) {
        return;
      }

      _lastFactRequestTime = DateTime.now();

      String fact = await getFactAboutObject(mostConfidentObject.detectedClass);

      if (fact.isNotEmpty) {
        setState(() {
          alreadyGivenFacts
              .add('<<${mostConfidentObject.detectedClass}: $fact>>');
        });
      }

      //// pass letter by letter
      for (int i = 0; i < fact.length; i++) {
        await Future.delayed(const Duration(milliseconds: 1));
        setState(() {
          curiousFact = fact.substring(0, i + 1);
        });
      }

      // setState(() {
      //   curiousFact = fact;
      // });
    }
  }

  Future<String> getFactAboutObject(String detectedClass) async {
    String prompt =
        "Give me a brief historical or curious fact about the following type of object: $detectedClass. If the object is 'Person' then give a curious fact about humans. Make the fact as interesting as possible. and make it around or less than 50 words.  Don't use any special characters. ${alreadyGivenFacts.isNotEmpty ? 'You have to avoid giving the same fact twice. You already gave the following facts: ${alreadyGivenFacts.join(', ')}' : ''}. The fact must be about the following concept/object: $detectedClass.";

    return await GeminiService().getResponse(prompt) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return AppScaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                        child: CameraPreview(_controller, child: Container())),
                    if (recognitions != null)
                      BoundingBoxes(
                        recognitions: recognitions!,
                        previewH: imageHeight.toDouble(),
                        previewW: imageWidth.toDouble(),
                        screenH: MediaQuery.of(context).size.height * 0.8,
                        screenW: MediaQuery.of(context).size.width,
                      ),
                  ],
                ),
              ),
              Positioned(
                bottom: 30,
                right: 7,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      curiousFact,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Colors.green,
                        backgroundColor: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.white.withOpacity(0.07)),
                  shape: WidgetStateProperty.all(const CircleBorder()),
                ),
                onPressed: () {
                  toggleCamera();
                },
                icon: const Icon(
                  Icons.cameraswitch_outlined,
                  size: 30,
                ),
              )
            ],
          )
        ],
      ),
      appBarTitle: 'Real-time object detection',
      isProtected: true,
      showScreenTitleInAppBar: false,
      scrollPhysics: const NeverScrollableScrollPhysics(),
    );
  }
}

class BoundingBoxes extends StatelessWidget {
  final List<RecognizedObject> recognitions;
  final double previewH;
  final double previewW;
  final double screenH;
  final double screenW;

  const BoundingBoxes({
    super.key,
    required this.recognitions,
    required this.previewH,
    required this.previewW,
    required this.screenH,
    required this.screenW,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: recognitions.map((rec) {
        var xPosition = rec.x * screenW;
        var yPosition = rec.y * screenH;
        double width = rec.width * screenW;
        double height = rec.height * screenH;

        if (width < 60) return Container();

        return Positioned(
          left: xPosition,
          top: yPosition,
          width: width,
          height: height + 13,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.lightGreen,
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    rec.detectedClass,
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontSize: 17,
                      background: Paint()..color = Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
