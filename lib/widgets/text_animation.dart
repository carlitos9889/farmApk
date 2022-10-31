import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({Key? key, required this.txt}) : super(key: key);
  final String txt;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        animatedTexts: [TyperAnimatedText(txt)],
      ),
    );
  }
}
