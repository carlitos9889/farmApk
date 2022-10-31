import 'package:flutter/material.dart';

class HeaderOrientacion extends StatelessWidget {
  const HeaderOrientacion({Key? key, required this.header}) : super(key: key);
  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        header,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
