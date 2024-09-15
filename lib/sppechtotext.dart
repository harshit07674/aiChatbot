import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:voicechatbot/geminiapiservice.dart';

final speechToText = SpeechToText();
String words ='';


Future<void> initSpeechToText() async {
  await speechToText.initialize();

}

Future<void> startListening() async {
  await speechToText.listen(onResult: onSpeechResult);

}

Future<void> stopListening() async {
  await speechToText.stop();

}

void onSpeechResult(SpeechRecognitionResult result) {
  words = result.recognizedWords;
}

