import 'package:flutter/material.dart';

class getDropwDownButtonvalues extends ChangeNotifier {
  String _name;

  String get name => _name;

  setName(String setName) {
    _name = setName;
    notifyListeners();
  }
}
