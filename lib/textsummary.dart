



import 'package:flutter/material.dart';
import 'package:voicechatbot/geminiapiservice.dart';

class TextSummaryScreen extends StatefulWidget {
  const TextSummaryScreen({Key? key}) : super(key: key);

  @override
  State<TextSummaryScreen> createState() => _TextSummaryScreenState();
}

class _TextSummaryScreenState extends State<TextSummaryScreen> {
  TextEditingController url = TextEditingController();
  TextEditingController lines = TextEditingController();
  String textsummary=" ";
  TextEditingController summarizedtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text("Grammer Check",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20),),),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: size.height*0.1,
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
              controller: url,
              maxLines: 3,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                hintText: "Enter your url here",

              ),
            ),
          ),
          Container(
            height: size.height*0.1,
            width: size.width*0.9,
            margin: EdgeInsets.only(left: 20,top:30,),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.amber,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: lines,
              keyboardType: TextInputType.number,
              maxLines: 3,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.white,fontSize: 18),
                hintText: "Enter no of lines of summary you need here",

              ),
            ),
          ),
          SizedBox(height: 20,),
          TextButton(onPressed: () async{
            summarizedtext.clear();
            textsummary = await getTextAnswers("give summary of text from following url: "+url.text+" in "+lines.text+" lines");
            summarizedtext.text = textsummary;
            setState(() {

            });
          }, child: Text("Get Summary")),
          SizedBox(height: 20,),

      Container(
                height: size.height*0.5,
                width: size.width*0.94,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.amber,width: 2)
                ),
                child: TextField(
                readOnly: true,
                  controller: summarizedtext,
                  maxLines: 15,
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18,),
                ),
              ),

        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    summarizedtext.clear();
    lines.clear();
    url.clear();
  }
}