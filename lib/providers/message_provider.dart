import 'package:flutter/material.dart';
import '../classes/message.dart';

class MessageProvider with ChangeNotifier {

  final List<Message> _messages = [];
  String _selfUsername = '';

  List<Message> get getMessages => _messages;
  String get getSelfUsername => _selfUsername;

  void setSelfUsername(String username) {
    _selfUsername = username;
  }

  void addMessage(Message message) {
    _messages.add(message);
    Future.delayed(
      const Duration(seconds: 1),
      () => notifyListeners(),
    );
  }
}
