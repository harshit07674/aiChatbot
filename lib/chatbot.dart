import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voicechatbot/Chatlist.dart';
import 'package:voicechatbot/geminiapiservice.dart';
import 'package:speech_to_text/speech_recognition_result.dart';


class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  TextEditingController words = TextEditingController();
  final speechToText = SpeechToText();
  final tts = FlutterTts();
  String chatitem='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSpeechToText();
    initTextToSpeech();

  }
  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {

    });
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);

  }

  Future<void> stopListening() async {
    await speechToText.stop();

  }
  Future<void> initTextToSpeech() async {
    await tts.setSharedInstance(true);
    setState(() {

    });
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    words.text = result.recognizedWords;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Center(child: Text("Voice Chatbot",style: TextStyle(fontSize: 24,color: Colors.amber,fontWeight: FontWeight.bold),)
        ,),),
      backgroundColor: Colors.black,
      body: Consumer<ChatListProvider>(
        builder: (context,chatword,child)=>
         Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                Container(
                  height: size.height*0.7,
                  width: size.width,
                  child: ListView.builder(itemBuilder: (context,index){
                    if(index%2==0){
                      return Container(
                        width: size.width*0.1,
                      margin: EdgeInsets.only(bottom: 20,right: 50,top: 20,left: 10),
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(radius: 10,backgroundColor: Colors.green,),
                              SizedBox(width: 20,),
                              Text("You",style: TextStyle(color: Colors.greenAccent,fontSize: 20,fontWeight: FontWeight.w500),)
                            ],
                          ),
                          Text("${chatword.questionAnswers[index]}",style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic,fontSize: 20),textAlign: TextAlign.left,),
                        ],
                      ),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen.shade100,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                        ),
                      );
                    }
                    else{
                      return Container(
                        width: size.width*0.3,
                        alignment: Alignment.bottomRight,
                        margin: EdgeInsets.only(left: 50,top: 40,right: 10),
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(width: size.width*0.5,),
                                Text("ChatBot",style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500,fontSize: 20),),
                                SizedBox(width: 20,),
                                CircleAvatar(radius: 10,backgroundColor: Colors.blueAccent.shade100,),
                              ],
                            ),
                            Text("${chatword.questionAnswers[index]}",style: TextStyle(color: Colors.black,fontSize: 18,),),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      );
                    }
                  },
                  itemCount: chatword.questionAnswers.length,),
                ),
                SizedBox(height: size.height*0.07,),
                Align(alignment: Alignment.bottomLeft,
                  child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: size.height*0.1,
                          width: size.width*0.92,
                          child: TextField(
                            controller: words,
                            autofocus: true,
                            style: TextStyle(fontSize: 18,color: Colors.white,),
                            maxLength: 300,
                            decoration: InputDecoration(
                              hintText: "Enter your question",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.amber,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: IconButton(onPressed: () async{
                                  if(await speechToText.hasPermission && speechToText.isNotListening){
                                    await startListening();
                                   setState(() {

                                   });
                                  }
                                 else if(speechToText.isListening){
                                   words.text = SpeechToText().lastRecognizedWords;
                                   setState(() {

                                   });
                                  }
                                 else{
                                   initSpeechToText();
                                   setState(() {

                                   });
                                  }
                              },icon: Icon(Icons.mic),),
                              prefixIconColor: Colors.white,
                              suffixIcon: IconButton(
                                onPressed: () async{
                                  chatitem=words.text;
                                  words.clear();
                                  chatword.addChat(chatitem);
                                  setState(() {

                                  });
                                    String answer = await getTextAnswers(chatitem + "remove all the asterisks");
                                    chatword.addChat(answer);

                                  setState(() {

                                  });

                                },icon: Icon(Icons.send,color: Colors.white,),

                              ),
                              hintStyle: TextStyle(color: Colors.white)
                            ),

                  ),

            ),
          ),
    ]
        ),
            ),),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  fluttertts.pause();
  words.clear();
 ChatListProvider().questionAnswers.clear();
  }
}
