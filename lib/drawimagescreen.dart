import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:voicechatbot/secretkeys.dart';
import 'package:voicechatbot/drawaiimageservice.dart';


class DrawAiImageScreen extends StatefulWidget {
  const DrawAiImageScreen({Key? key}) : super(key: key);

  @override
  State<DrawAiImageScreen> createState() => _DrawAiImageScreenState();
}

class _DrawAiImageScreenState extends State<DrawAiImageScreen> {
  TextEditingController prompt = TextEditingController();
  Uint8List imagedata = Uint8List(0);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text("Ai Image Generation",style: TextStyle(color: Colors.amber,fontSize: 18,fontWeight: FontWeight.bold),),),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: size.height*0.4,
            width: size.width*0.9,
            margin: EdgeInsets.only(left: 20,top:30,),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: prompt,
              maxLines: 15,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                hintText: "Enter your prompt for image",

              ),
            ),
          ),
          SizedBox(height: 20,),
          TextButton(onPressed: () async{

           imagedata = await drawImage(prompt.text);
           setState(() {

           });
          }, child: Text("create")),
          SizedBox(height: 20,),
          Container(height: size.height*0.3,width: size.width*0.9,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
            border: Border.all(
              color: Colors.amber,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 2,
                spreadRadius: 2,
              )
            ],
            image: imagedata.length!=0?DecorationImage(image: MemoryImage(imagedata),fit: BoxFit.fill):DecorationImage(image: AssetImage("assets/gallery-removebg-previewq.png"),fit: BoxFit.fill))
          ,),
        
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    imagedata.clear();
    prompt.clear();
  }
}
