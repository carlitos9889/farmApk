import 'package:farmapk/models/data_json.dart';
import 'package:flutter/material.dart';

class OrdeQuiz extends StatelessWidget {
  const OrdeQuiz({Key? key, required this.quiz}) : super(key: key);
  final Quiz quiz;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: size.width * 0.055, top: 20, bottom: 20),
      child:
          Text(quiz.orden, style: const TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
