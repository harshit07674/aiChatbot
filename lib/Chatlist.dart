import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class ChatListProvider extends ChangeNotifier{
  List<String> questionAnswers=[];

  void addChat(String chatitem ){
    questionAnswers.add(chatitem);
    notifyListeners();
  }
}


