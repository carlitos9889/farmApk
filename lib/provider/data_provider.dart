// ignore_for_file: unnecessary_getters_setters

import 'package:farmapk/models/data_json.dart';
import 'package:flutter/material.dart';

class DataJsonPRovider extends ChangeNotifier {
  late Data _datajson;

  Data get datajson => _datajson;

  set datajson(Data data) {
    _datajson = data;
  }
}
