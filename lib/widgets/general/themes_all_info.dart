import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/info_enum.dart';
import 'package:farmapk/widgets/subheader.dart';
import 'package:flutter/material.dart';

class ThemeAllInfo extends StatelessWidget {
  const ThemeAllInfo(this.tema, this.index, {Key? key}) : super(key: key);
  final DataTema tema;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tema ${index + 1}: ${tema.tema}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const SubHeader(subHeader: 'Objetivos:'),
        InfoEnumerado(info: tema.objetivo),
        _GetThemesAndObejtivos(temas: tema.temas),
      ],
    );
  }
}

class _GetThemesAndObejtivos extends StatelessWidget {
  const _GetThemesAndObejtivos({Key? key, required this.temas})
      : super(key: key);
  final List<TemaTema> temas;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        temas.length,
        (index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (temas[index].tema.isNotEmpty)
              SubHeader(subHeader: '${temas[index].tema}:'),
            Column(
              children: List.generate(
                temas[index].puntos.length,
                (i) => InfoEnumerado(
                  info: temas[index].puntos[i],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
