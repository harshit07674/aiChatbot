

import 'package:flutter/material.dart';
import 'package:voicechatbot/Chatlist.dart';
import 'package:voicechatbot/chatbot.dart';
import 'package:voicechatbot/drawimagescreen.dart';
import 'package:voicechatbot/grammercheckscreen.dart';
import 'package:voicechatbot/rowswidget.dart';
import 'package:provider/provider.dart';
import 'package:voicechatbot/textsummary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (contex)=>ChatListProvider())
      ],
      child:
        MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
          debugShowCheckedModeBanner: false,
),

    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(child: Text("Voice Chatbot",style: TextStyle(fontSize: 24,color: Colors.amber),),),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              GestureDetector(onTap: (){

                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>ChatBot()));
    },
                child: RowsWidget(title: "Chatbot",
     icon: Icon(Icons.chat_bubble_outlined,color: Colors.black,size: 50,))),
              SizedBox(width: 40,),
              GestureDetector(onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>DrawAiImageScreen()));
    },
                child: RowsWidget(title: "Draw Ai Image", icon: Icon(Icons.draw_rounded,color: Colors.black,size: 50,))),
    ],
    ),
    SizedBox(height: 20,),
    Row(
    children: [
    GestureDetector(onTap: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> GrammerCheckScreen()));
    },

    child: RowsWidget(title: "Grammer Check", icon: Icon(Icons.check_box,color: Colors.black,size: 50,)
    )),
              SizedBox(width: 40,),
              GestureDetector(onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>TextSummaryScreen()));
    },child: RowsWidget(title: "Text Summary",
    icon: Icon(Icons.summarize_outlined,color: Colors.black,size: 50,))),
            ],
          )
        ],
      ),
    );
  }
}

