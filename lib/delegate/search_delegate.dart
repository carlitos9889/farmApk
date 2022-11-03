import 'package:farmapk/helpers/format_data_to_json.dart';
import 'package:farmapk/helpers/get_icons.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/search/sugestions_results.dart';
import 'package:flutter/material.dart';

class SearchMedicamentos extends SearchDelegate {
  late Medicamento medicamento;
  final TextStyle styleMedicamentoName =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  final TextStyle styleMedicamentoCapsula =
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  @override
  String get searchFieldLabel => "Buscar Medicamentos";

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  Widget buildResults(BuildContext context) {
    return Result(medicamento: medicamento);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: DataFromJson.data.getMedicamentosSugeridos(query),
      builder:
          (BuildContext context, AsyncSnapshot<List<Medicamento>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return Sugestions(
              children: snapshot.data!
                  .map(
                    (m) => ListTile(
                      leading: getImageIconMedicamento(m.cap, 40),
                      title: Text(m.med, style: styleMedicamentoName),
                      subtitle: Text(m.cap, style: styleMedicamentoCapsula),
                      onTap: () {
                        medicamento = m;
                        showResults(context);
                      },
                    ),
                  )
                  .toList(),
            );
          } else if (query.isNotEmpty && snapshot.data!.isEmpty) {
            return Center(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'No se han econtrado coincidencias con el medicamento: $query',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
        }
        return Container();
      },
    );
  }
}
