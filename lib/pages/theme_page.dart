import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/themes/card_guia.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final DataTema tema =
        ModalRoute.of(context)!.settings.arguments as DataTema;

    return Scaffold(
      appBar: AppBar(title: const Text('Atrás')),
      body: FadeInLeft(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const AutoSizeText(
              'Guías de Studio',
              maxFontSize: 28,
              minFontSize: 25,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: tema.guias.length,
                itemBuilder: (_, i) => CardGuia(tema.guias[i]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
