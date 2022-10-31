import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/styles/estilos_app.dart';
import 'package:farmapk/widgets/tests/armar_evaluacion.dart';
import 'package:farmapk/widgets/tests/scrooll_sin_glow.dart';
import 'package:flutter/material.dart';

class QuizCompletar extends StatefulWidget {
  const QuizCompletar({Key? key, required this.quiz, required this.estadoBoton})
      : super(key: key);
  final Quiz quiz;
  final bool estadoBoton;

  @override
  State<QuizCompletar> createState() => _QuizCompletarState();
}

class _QuizCompletarState extends State<QuizCompletar> {
  late List<TextEditingController> textEditingControllerList;

  @override
  void initState() {
    super.initState();
    textEditingControllerList = List.generate(
        widget.quiz.respuestasposibles.length,
        (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.quiz.respuestasposibles.length; i++) {
      textEditingControllerList[i].dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScroollWithOutGlow(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrdeQuiz(quiz: widget.quiz),
              Column(
                children: List.generate(widget.quiz.respuestasposibles.length,
                    (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            widget.quiz.respuestasposibles[index],
                          ),
                        ),
                        Flexible(
                          child: TextField(
                            readOnly: !widget.estadoBoton,
                            controller: textEditingControllerList[index],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.only(top: 90),
                            ),
                            enableSuggestions: false,
                          ),
                        ),
                        _getIconResponse(widget.quiz, index),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getIconResponse(Quiz quiz, int index) {
    if (!widget.estadoBoton) {
      final List<String> respCorrectas =
          widget.quiz.respuestascorrectas[index].toLowerCase().split(', ');
      return respCorrectas
              .contains(textEditingControllerList[index].text.toLowerCase())
          ? const Icon(Icons.check_circle, color: colorGreenAccent)
          : const Icon(Icons.clear, color: Colors.red);
    }
    return Container();
  }
}
