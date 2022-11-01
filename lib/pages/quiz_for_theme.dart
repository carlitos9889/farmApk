import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/tests/quiz_seleccionar.dart';
import 'package:flutter/material.dart';

class QuizForTheme extends StatelessWidget {
  const QuizForTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataTema = ModalRoute.of(context)!.settings.arguments as DataTema;
    return Scaffold(
        appBar: AppBar(title: const Text('Atrás')),
        body: Stack(
          children: [
            PageView.builder(
              itemCount: dataTema.quiz.length,
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
          ],
        ));
  }
}
