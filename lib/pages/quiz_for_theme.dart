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
  bool checkBoton = false;

  @override
  void initState() {
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
            onPageChanged: _onPageChanged,
            itemBuilder: (_, i) {
              if (dataTema.quiz[i].tipo == 'seleccionar') {
                return QuizSeleccionar(
                  quiz: dataTema.quiz[i],
                  estadoBoton: checkBoton,
                );
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
                onPressed: !checkBoton ? _revisarRespuesta : null,
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

  void _onPageChanged(int value) {
    setState(() {
      if (value != currentPage) {
        checkBoton = false;
      }
      currentPage = value;
    });
  }

  void _revisarRespuesta() {
    setState(() => checkBoton = true);
  }

  ButtonStyle _styleButton() => ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        maximumSize: const Size(250, 50),
      );
}
