import 'package:flutter/material.dart';
import 'package:voicechatbot/geminiapiservice.dart';

class GrammerCheckScreen extends StatefulWidget {
  const GrammerCheckScreen({Key? key}) : super(key: key);

  @override
  State<GrammerCheckScreen> createState() => _GrammerCheckScreenState();
}

class _GrammerCheckScreenState extends State<GrammerCheckScreen> {
  TextEditingController rawword = TextEditingController();
  TextEditingController correction = TextEditingController();
  String grammercorrect='';
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
                 controller: rawword,
                 maxLines: 15,
                 style: TextStyle(color: Colors.white),
                 decoration: InputDecoration(
                   hintStyle: TextStyle(color: Colors.white,fontSize: 20),
                   hintText: "Enter your text here",

                 ),
               ),
             ),
             SizedBox(height: 20,),
             TextButton(onPressed: () async{
               correction.clear();
               grammercorrect = await getTextAnswers("check spelling and grammer both in the following sentence: "+rawword.text);
               correction.text = grammercorrect;
               setState(() {

               });
             }, child: Text("Grammer Check")),
             SizedBox(height: 20,),
             Container(
               height: size.height*0.3,
               width: size.width*0.9,
               padding: EdgeInsets.only(left: 10),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20),
                 border: Border.all(color: Colors.amber,width: 2)
               ),
               child: TextField(
                 readOnly: true,
                 controller: correction,
                 maxLines: 15,
                 style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18,),
               ),
             )
           ],
         ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    correction.clear();
    rawword.clear();
  }
}
