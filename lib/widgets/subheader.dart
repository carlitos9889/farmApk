import 'package:flutter/material.dart';

class SubHeader extends StatelessWidget {
  const SubHeader({Key? key, required this.subHeader}) : super(key: key);
  final String subHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      child: Text(
        subHeader,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
