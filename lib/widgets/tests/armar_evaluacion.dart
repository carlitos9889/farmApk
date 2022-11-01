import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:flutter/material.dart';

class OrdeQuiz extends StatelessWidget {
  const OrdeQuiz({Key? key, required this.quiz}) : super(key: key);
  final Quiz quiz;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: size.width * 0.055,
        top: 120,
        bottom: 20,
        right: size.width * 0.055,
      ),
      child: AutoSizeText(
        quiz.orden,
        maxFontSize: 18,
        minFontSize: 16,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
