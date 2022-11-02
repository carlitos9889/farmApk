import 'package:animate_do/animate_do.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/provider/data_provider.dart';
import 'package:farmapk/widgets/general/datos_preliminares.dart';
import 'package:farmapk/widgets/general/temas_info.dart';
import 'package:farmapk/widgets/scrooll_with_search.dart';
import 'package:farmapk/widgets/title_and_info.dart';
import 'package:farmapk/widgets/title_and_info_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrientacionesGeenrales extends StatelessWidget {
  const OrientacionesGeenrales({Key? key}) : super(key: key);
  static const String routeName = 'orientaciones_page';

  @override
  Widget build(BuildContext context) {
    final Data data = Provider.of<DataJsonPRovider>(context).datajson;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: IconButton(
          icon: Row(
            children: const [
              Icon(Icons.arrow_back),
              Text('Atrás', style: TextStyle(fontSize: 20)),
            ],
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BounceInDown(
        child: SearcAndScrollJoin(
          children: [
            Preliminares(data.orientaciones.preliminares),
            TitleAndInfo(
              header: data.orientaciones.guia[0].header,
              info: data.orientaciones.guia[0].info,
            ),
            TitleAndInfoEnum(
              title: 'Objetivos Generales de la\nAsignatura',
              info: data.orientaciones.objetivos,
            ),
            TemasInfo(temas: data.temas),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
