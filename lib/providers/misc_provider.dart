import 'package:flutter/material.dart';

class MiscProvider with ChangeNotifier {
  int _range = 0;

  void setRange(int range) {
    _range = range;
    notifyListeners();
  }

  int get getRange => _range;
}
