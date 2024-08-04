class RecognizedObject {
  final double x;
  final double y;
  final double width;
  final double height;
  final double confidence;
  final String detectedClass;

  RecognizedObject({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.confidence,
    required this.detectedClass,
  });

  factory RecognizedObject.fromMap(Map<dynamic, dynamic> map) {
    return RecognizedObject(
      x: map['rect']['x'] as double,
      y: map['rect']['y'] as double,
      width: map['rect']['w'] as double,
      height: map['rect']['h'] as double,
      confidence: map['confidenceInClass'] as double,
      detectedClass: map['detectedClass'] as String,
    );
  }

  @override
  String toString() {
    return 'ObjectRecognition(detectedClass: $detectedClass, confidence: $confidence, rect: [$x, $y, $width, $height])';
  }
}
