import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/tests/quiz_seleccionar.dart';
import 'package:flutter/material.dart';

class QuizForTheme extends StatefulWidget {
  const QuizForTheme({Key? key}) : super(key: key);

  @override
  State<QuizForTheme> createState() => _QuizForThemeState();
}

class _QuizForThemeState extends State<QuizForTheme> {
  late PageController pController;
  int currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pController = PageController();
    pController.addListener(() {
      setState(() {
        currentPage = pController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataTema = ModalRoute.of(context)!.settings.arguments as DataTema;
    return Scaffold(
      appBar: AppBar(title: const Text('Atrás')),
      body: Stack(
        children: [
          PageView.builder(
            itemCount: dataTema.quiz.length,
            controller: pController,
            itemBuilder: (_, i) {
              if (dataTema.quiz[i].tipo == 'seleccionar') {
                return QuizSeleccionar(quiz: dataTema.quiz[i]);
              } else {
                return Center(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      dataTema.quiz[i].orden,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: _styleButton(),
                onPressed: () {},
                child: AutoSizeText.rich(
                  TextSpan(text: 'Revisar', children: [
                    TextSpan(
                        text: ' ${currentPage + 1}/${dataTema.quiz.length}'),
                  ]),
                  maxFontSize: 24,
                  minFontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ButtonStyle _styleButton() => ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        maximumSize: const Size(250, 50),
      );
}
