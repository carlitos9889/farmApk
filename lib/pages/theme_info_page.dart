import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/title_and_info.dart';
import 'package:farmapk/widgets/title_and_info_enum.dart';
import 'package:flutter/material.dart';

class ThemeInfoPage extends StatelessWidget {
  const ThemeInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TemaGuia guia =
        ModalRoute.of(context)!.settings.arguments as TemaGuia;

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
      body: FadeInLeft(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                guia.temaGuia.endsWith('.')
                    ? guia.temaGuia.substring(0, guia.temaGuia.length - 1)
                    : guia.temaGuia,
                minFontSize: 26,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 120),
              child: const Divider(height: 20),
            ),
            TitleAndInfo(
              header: 'Introduccion',
              info: guia.introduccion,
            ),
            TitleAndInfoEnum(
              title: 'Objetivos',
              info: guia.objetivos,
            ),
            TitleAndInfoEnum(
              title: 'En este tema debes revisar los siguientes contenidos',
              info: guia.enestetema,
            ),
            TitleAndInfoEnum(
              title: 'Bibliografia Basica',
              info: guia.bibliografia.basica,
            ),
            TitleAndInfoEnum(
              title: 'Bibliografia Complementaria',
              info: guia.bibliografia.complementaria,
            ),
            TitleAndInfoEnum(
              title: 'Literatura de consulta',
              info: guia.bibliografia.consulta,
            ),
            TitleAndInfo(
              header: 'Orientaciones para el estudio:',
              info: guia.estudio.info,
            ),
            TitleAndInfoEnum(
              title: 'Puntualizar en los siguientes aspectos',
              info: guia.estudio.puntos,
            )
          ],
        ),
      ),
    );
  }
}
