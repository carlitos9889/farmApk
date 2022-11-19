import 'package:auto_size_text/auto_size_text.dart';
import 'package:beamer/beamer.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/themes/card_guia.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key, required this.tema}) : super(key: key);
  final List<TemaGuia> tema;

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => Beamer.of(context).beamBack(),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const AutoSizeText(
            'Guías de Studio',
            maxFontSize: 28,
            minFontSize: 22,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: tema.length,
              itemBuilder: (_, index) => CardGuia(tema, index: index),
            ),
          )
        ],
      ),
    );
  }
}
