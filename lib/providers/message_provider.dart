import 'package:flutter/material.dart';

class MessageProvider with ChangeNotifier {

  String _input = '';

  String get getInput => _input;

  set setInput(String input) {
    _input = input;
    notifyListeners();
  }
}
