// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

class LogicaProvider extends ChangeNotifier {
  int _estadoBotonCheck = 0;

  int get estadoBotonCheck => _estadoBotonCheck;
  set estadoBotonCheck(int newVal) {
    _estadoBotonCheck = newVal;
    // notifyListeners();
  }
}
