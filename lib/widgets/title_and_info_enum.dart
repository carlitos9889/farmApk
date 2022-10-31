import 'package:farmapk/widgets/general/header_orientacion.dart';
import 'package:farmapk/widgets/info_enum.dart';
import 'package:flutter/material.dart';

class TitleAndInfoEnum extends StatelessWidget {
  const TitleAndInfoEnum({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  final String title;
  final List<String> info;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          left: size.width * 0.03, bottom: 10, right: size.width * 0.03),
      child: Column(
        children: [
          HeaderOrientacion(header: title),
          const SizedBox(height: 10),
          Column(
            children: List.generate(
              info.length,
              (index) => InfoEnumerado(info: info[index]),
            ),
          ),
        ],
      ),
    );
  }
}


//objetivos  objetivos[index]
