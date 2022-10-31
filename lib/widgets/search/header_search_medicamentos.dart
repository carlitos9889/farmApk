import 'package:farmapk/helpers/get_icons.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:flutter/material.dart';

class HeaderSearchMedicamento extends StatelessWidget {
  const HeaderSearchMedicamento(this.medicamento, {Key? key}) : super(key: key);
  final Medicamento medicamento;
  final TextStyle styleMedicamentoName =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  final TextStyle styleMedicamentoCap =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: size.width * 0.022, vertical: 20),
        // height: 100,
        child: ListTile(
          leading: getImageIconMedicamento(medicamento.cap, 72),
          title: Text(medicamento.med, style: styleMedicamentoName),
          subtitle: Text(medicamento.cap, style: styleMedicamentoCap),
        ),
      ),
    );
  }
}
