import 'package:camera/camera.dart';
import 'package:curiosity_eye_app/app_settings/theme_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/AppScaffold/app_scaffold.dart';
import '../object_detection_screen/object_detection_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<CameraDescription> cameras = [];
  bool isLoading = true;
  @override
  void initState() {
    loadData();
  }

  Future<void> loadData() async {
    cameras = await availableCameras();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const AppScaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
        appBarTitle: 'Home Screen',
        isProtected: true,
        scrollPhysics: NeverScrollableScrollPhysics(),
      );
    }
    return AppScaffold(
      useTopAppBar: false,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Curiosity Eye',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontFamily:
                      GoogleFonts.getFont(ThemeSettings.tertiaryTextStyle.name)
                          .fontFamily,
                ),
          ),
          const SizedBox(height: 38),
          Container(
            width: 250,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.crop_free_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ObjectDetectionScreen(cameras: cameras),
                  ),
                );
              },
              label: Text('Open Camera',
                  style: TextStyle(
                    fontSize: 15,
                  )),
            ),
          ),
        ],
      ),
      appBarTitle: 'Home Screen',
      isProtected: false,
      scrollPhysics: NeverScrollableScrollPhysics(),
    );
  }
}
