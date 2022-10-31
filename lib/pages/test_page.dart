import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key, required this.dataTemas}) : super(key: key);
  static const String routeName = 'test_page';

  final List<DataTema> dataTemas;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin:
              EdgeInsets.symmetric(vertical: 26, horizontal: size.width * 0.17),
          child: const AutoSizeText(
            'Autoevaluaciones',
            maxFontSize: 28,
            minFontSize: 25,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 4.0,
            children: List.generate(
                dataTemas.length, (i) => _quizCard(dataTemas[i], i)),
          ),
        ),
      ],
    );
  }

  GestureDetector _quizCard(DataTema dataTema, int i) => GestureDetector(
        onTap: () {},
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: i % 2 == 0 ? _cardDecoration() : _decoration(),
            child: Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                dataTema.tema,
                maxLines: 5,
                maxFontSize: 20,
                minFontSize: 18,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      );

  BoxDecoration _cardDecoration() => BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10.0),
        gradient: const LinearGradient(
          colors: [Color(0xff1A86C7), Color.fromRGBO(62, 198, 116, 0.65)],
        ),
      );

  BoxDecoration _decoration() => BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(10.0),
        gradient: const LinearGradient(
          colors: [Color.fromRGBO(62, 198, 116, 0.65), Color(0xff1A86C7)],
        ),
      );
}
