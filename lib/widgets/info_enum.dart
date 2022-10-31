import 'package:farmapk/widgets/point.dart';
import 'package:flutter/material.dart';

class InfoEnumerado extends StatelessWidget {
  const InfoEnumerado({Key? key, required this.info}) : super(key: key);

  final textstyle = const TextStyle(fontSize: 15, fontWeight: FontWeight.w400);
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Point(),
            Flexible(
                child:
                    Text(info, style: textstyle, textAlign: TextAlign.justify))
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
