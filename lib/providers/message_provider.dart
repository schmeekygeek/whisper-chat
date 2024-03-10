import 'package:flutter/material.dart';
import '../classes/message.dart';

class MessageProvider with ChangeNotifier {

  final List<Message> _messages = [];

  List<Message> get getMessages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
    Future.delayed(Duration(seconds: 1), () {
      notifyListeners();
    });
  }
}
