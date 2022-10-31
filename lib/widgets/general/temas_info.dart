// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/general/header_orientacion.dart';
import 'package:farmapk/widgets/general/themes_all_info.dart';
import 'package:flutter/material.dart';

class TemasInfo extends StatelessWidget {
  const TemasInfo({Key? key, required this.temas}) : super(key: key);
  final List<DataTema> temas;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.03),
      child: Column(
        children: [
          const HeaderOrientacion(header: 'OBJETIVOS Y CONTENIDOS POR TEMAS:'),
          Column(
            children:
                List.generate(temas.length, (i) => ThemeAllInfo(temas[i], i)),
          ),
        ],
      ),
    );
  }
}
