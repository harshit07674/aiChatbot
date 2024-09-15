import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:voicechatbot/secretkeys.dart';
import 'package:stability_image_generation/stability_image_generation.dart';

Uint8List image = Uint8List(0);
final StabilityAI stable = StabilityAI();


Future<Uint8List> drawImage(String prompt) async{
  image = await stable.generateImage(prompt: prompt, apiKey:   drawimagekey, imageAIStyle: ImageAIStyle.digitalPainting);
  return image;
}