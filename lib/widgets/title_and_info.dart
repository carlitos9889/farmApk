import 'package:farmapk/widgets/general/header_orientacion.dart';
import 'package:flutter/material.dart';

class TitleAndInfo extends StatelessWidget {
  const TitleAndInfo({
    Key? key,
    required this.header,
    required this.info,
  }) : super(key: key);
  final String header, info;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 20),
      child: Column(
        children: [
          HeaderOrientacion(header: header),
          Text(
            info,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
