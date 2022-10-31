import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/provider/logica_provider.dart';
import 'package:farmapk/styles/estilos_app.dart';
import 'package:farmapk/widgets/tests/armar_evaluacion.dart';
import 'package:farmapk/widgets/tests/scrooll_sin_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizSeleccionar extends StatefulWidget {
  const QuizSeleccionar({
    Key? key,
    required this.quiz,
    required this.estadoBoton,
  }) : super(key: key);
  final Quiz quiz;
  final bool estadoBoton;

  @override
  State<QuizSeleccionar> createState() => _QuizSeleccionarState();
}

class _QuizSeleccionarState extends State<QuizSeleccionar> {
  List<bool> checks = [];

  @override
  void initState() {
    super.initState();
    checks.clear();
    checks =
        List.generate(widget.quiz.respuestasposibles.length, (index) => false);
  }

  @override
  void dispose() {
    super.dispose();
    checks.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final logicaProvider = Provider.of<LogicaProvider>(context);

    return Scaffold(
      body: ScroollWithOutGlow(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ------------- Pregunta del quiz --------------- //
              OrdeQuiz(quiz: widget.quiz),
              // ------------- Genera todas las posibles respuestas
              Column(
                children: List.generate(widget.quiz.respuestasposibles.length,
                    (index) {
                  if (logicaProvider.estadoBotonCheck == 2) {
                    logicaProvider.estadoBotonCheck = 0;
                    checks = List.generate(
                        widget.quiz.respuestasposibles.length,
                        (index) => false);
                  }
                  return Container(
                    margin: EdgeInsets.only(
                      left: size.width * 0.08,
                      top: 20,
                      right: size.width * 0.08,
                    ),
                    decoration: BoxDecoration(
                      color: _getColorBackground(widget.quiz, index),
                      border: Border.all(
                        color: _getColorBorder(widget.quiz, index),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: CheckboxListTile(
                      activeColor:
                          widget.estadoBoton ? colorGreenAccent : Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checks[index],
                      title: Text(
                        widget.quiz.respuestasposibles[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                      onChanged: widget.estadoBoton
                          ? (value) {
                              setState(() {
                                checks[index] = value!;
                              });
                            }
                          : _logicaRevisar(index),
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

  Color _getColorBorder(Quiz quiz, int index) {
    // ------- Estado de seleccionar respuesta ---------- //
    final List<String> resp =
        quiz.respuestascorrectas.map((resp) => resp.toLowerCase()).toList();
    final String respActual = quiz.respuestasposibles[index].toLowerCase();

    if (widget.estadoBoton) {
      return checks[index] ? colorAmbar : colorGreenLightLight;
      // ------- Estado de revisar y la respuesta es correcta --------- //
    } else if (checks[index] && resp.contains(respActual)) {
      return colorGreenAccent;
      // ------- Estado de revisar y la respuesta es incorrecta --------- //
    } else if (checks[index] && !resp.contains(respActual)) {
      return Colors.red;
      // ------- Estado de revisar y la respuesta correcta no es seleccionada --------- //
    } else if (!checks[index] && resp.contains(respActual)) {
      return colorGreenAccent;
    } else {
      return Colors.grey;
    }
  }

  _getColorBackground(Quiz quiz, int index) {
    final List<String> resp =
        quiz.respuestascorrectas.map((resp) => resp.toLowerCase()).toList();
    final String respActual = quiz.respuestasposibles[index].toLowerCase();
    if (widget.estadoBoton) {
      return Colors.white;
      // ------- Estado de revisar y la respuesta es correcta --------- //
    } else if (checks[index] && resp.contains(respActual)) {
      return colorGreenAccent;
      // ------- Estado de revisar y la respuesta es incorrecta --------- //
    } else if (checks[index] && !resp.contains(respActual)) {
      return Colors.red;
      // ------- Estado de revisar y la respuesta correcta no es seleccionada --------- //
    } else if (!checks[index] && resp.contains(respActual)) {
      return colorGreenLight;
    } else {
      return Colors.transparent;
    }
  }

  _logicaRevisar(int index) {
    if (checks[index]) {}
    return null;
  }
}
