import 'package:farmapk/helpers/get_icons.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String txt;
  const Header({Key? key, required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 4, left: size.width * 0.055),
      width: double.infinity,
      child: Text(
        txt,
        style: TextStyle(
          fontSize: size.width < sizePre ? 20 : 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
