import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:voicechatbot/Chatlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:voicechatbot/secretkeys.dart';
import 'package:http/http.dart' as http;

FlutterTts fluttertts = FlutterTts();
String imagedata = '';

getTextAnswers(String question) async{
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apikey);
  final content = [Content.text("${question}")];
  final response = await model.generateContent(content);
  await fluttertts.setSharedInstance(true);
  await fluttertts.speak(response?.text??"no text");
  return response.text;
}