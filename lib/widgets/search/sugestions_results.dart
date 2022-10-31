import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/search/header_search_medicamentos.dart';
import 'package:flutter/material.dart';

class Sugestions extends StatelessWidget {
  const Sugestions({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({Key? key, required this.medicamento}) : super(key: key);

  final Medicamento medicamento;
  final TextStyle styleKey =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle styleValue =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final aux = medicamento.toJson().keys.where((key) {
      return !(key.contains('med') || key.contains('cap'));
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderSearchMedicamento(medicamento),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                children: aux.map((key) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('${_getKeyReales(key)}:', style: styleKey),
                      ),
                      const SizedBox(height: 4),
                      if (key != 'Sobredosis')
                        Text(medicamento.toJson()[key],
                            textAlign: TextAlign.justify),
                      const SizedBox(height: 4),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getKeyReales(String key) {
    switch (key) {
      case 'ind':
        return "Indicaciones";
      case 'cont':
        return "Contraindicaciones";
      case 'pre':
        return "Precauciones";
      case 'ra':
        return "Reacciones Adversas";
      case 'int':
        return "Interacciones";
      case 'pos':
        return "Posologia";
      default:
        return 'Sobredosis';
    }
  }
}
