import 'package:flutter/material.dart';
import 'package:whisper_chat/classes/message.dart';

class MessageProvider with ChangeNotifier {

  final List<Message> _messages = [];

  List<Message> get getMessages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
  }
}
