import 'package:flutter/material.dart';

final Map<String, IconData> _icons = {
  "school": Icons.school,
  "calendar_month": Icons.calendar_month,
  "hourglass_empty": Icons.hourglass_empty,
  "timer": Icons.timer,
};

Icon getIconPrelminar(String nombreIcon) => Icon(_icons[nombreIcon]);

Image getImageIconMedicamento(String cap, double size) {
  List<String> posibleCapsulas = [
    "Ampolleta",
    "Bulbo",
    "Capsula",
    "Frasco",
    "Jalea",
    "Polvo",
    "Supositorio",
    "Suspension",
    "Tableta"
  ];
  final String aux = posibleCapsulas.firstWhere((e) {
    final aux1 = cap.split(' ')[0];
    return e == (aux1[0].toUpperCase() + aux1.substring(1));
  }, orElse: () => 'Tableta');

  return Image(image: AssetImage('assets/icon/$aux.png'), width: 40);
}

const int sizePre = 350;
