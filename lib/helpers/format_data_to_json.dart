import 'package:farmapk/models/data_json.dart';
import 'package:flutter/services.dart';

class DataFromJson {
  static DataFromJson get data => DataFromJson();

  Future<Data> getDataJson() async {
    final String info = await rootBundle.loadString('data/data.json');
    return dataFromJson(info);
  }

  Future<List<DataTema>> getTemasArr() async {
    final Data data = await getDataJson();

    return data.temas;
  }

  Future<List<Medicamento>> getMedicamentosSugeridos(String query) async {
    final Data data = await getDataJson();
    final List<Medicamento> medicamentos = data.medicamentos;

    return (query.isEmpty)
        ? []
        : medicamentos
            .where((m) => m.med.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }
}
