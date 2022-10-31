import 'package:farmapk/helpers/get_icons.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/pages/quiz_resolve_page.dart';
import 'package:farmapk/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardQuizForTheme extends StatelessWidget {
  const CardQuizForTheme({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataJsonPRovider>(context).datajson;
    final DataTema tema = data.temas[index - 1];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ResolveQuizPage(quizList: tema.quiz, numeroTema: index),
          ),
        );
      },
      child: _CardQuizTemas(index: index, tema: tema),
    );
  }
}

class _CardQuizTemas extends StatelessWidget {
  const _CardQuizTemas({
    Key? key,
    required this.index,
    required this.tema,
  }) : super(key: key);

  final int index;
  final DataTema tema;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(size.width < sizePre ? 10 : 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [
            Color(0xff1A86C7),
            Color.fromRGBO(62, 198, 116, 0.65),
          ],
        ),
      ),
      child: _NumeroTemaCantidadPreguntas(index: index, tema: tema),
    );
  }
}

class _NumeroTemaCantidadPreguntas extends StatelessWidget {
  const _NumeroTemaCantidadPreguntas({
    Key? key,
    required this.index,
    required this.tema,
  }) : super(key: key);

  final int index;
  final DataTema tema;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(index.toString(),
            style: TextStyle(
                fontSize: size.width < sizePre ? 40 : 70,
                fontWeight: FontWeight.w400,
                color: Colors.white)),
        Text(
          '${tema.quiz.length} preguntas',
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ],
    );
  }
}
