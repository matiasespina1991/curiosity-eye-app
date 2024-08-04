import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import '../services/error_reporting_service.dart';

class GeminiService {
  final model = FirebaseVertexAI.instance.generativeModel(
    model: 'gemini-1.5-pro-001',
  );

  Future<String?> getResponse(String inputText) async {
    const prompt = '''
Say hi.
    ''';

    try {
      final GenerateContentResponse response =
          await model.generateContent([Content.text(prompt)]);

      return response.text;
    } catch (e, stackTrace) {
      await ErrorReportingService.reportError(e, stackTrace, null,
          screen: 'GeminiService',
          errorLocation: 'getTherapyTags',
          additionalInfo: [
            'User input text: $inputText',
          ]);
      return null;
    }
  }
}
