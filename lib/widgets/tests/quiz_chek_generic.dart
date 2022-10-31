import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/provider/logica_provider.dart';
import 'package:farmapk/styles/estilos_app.dart';
import 'package:farmapk/widgets/tests/armar_evaluacion.dart';
import 'package:farmapk/widgets/tests/scrooll_sin_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizCheckGenerico extends StatefulWidget {
  const QuizCheckGenerico(
      {Key? key, required this.quiz, required this.estadoBoton})
      : super(key: key);
  final Quiz quiz;
  final bool estadoBoton;
  @override
  State<QuizCheckGenerico> createState() => _QuizCheckGenericoState();
}

class _QuizCheckGenericoState extends State<QuizCheckGenerico> {
  List<String> checks = [];
  List<int> checksInt = [];
  String opciones = '';
  int index = 0;

  @override
  void initState() {
    super.initState();
    checks =
        List.generate(widget.quiz.respuestasposibles.length, (index) => '');
    checksInt =
        List.generate(widget.quiz.respuestasposibles.length, (index) => 0);
    opciones = widget.quiz.respuestascorrectas
        .map((e) {
          index++;
          return '$index. $e';
        })
        .toList()
        .join('   ');
  }

  @override
  void dispose() {
    checks.clear();
    index = 0;
    checksInt.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final logicaProvider = Provider.of<LogicaProvider>(context);

    return Scaffold(
      body: ScroollWithOutGlow(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OrdeQuiz(quiz: widget.quiz),
            if (widget.quiz.tipo == 'relacionar')
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  opciones,
                  textAlign: TextAlign.center,
                ),
              ),
            // ------------- Generar la tarjeta del checked ---------------- //
            Column(
              children: List.generate(
                widget.quiz.respuestasposibles.length,
                (index) {
                  if (logicaProvider.estadoBotonCheck == 2) {
                    logicaProvider.estadoBotonCheck = 0;
                    checks = List.generate(
                        widget.quiz.respuestasposibles.length, (index) => '');
                  }
                  return GestureDetector(
                    onTap: () => widget.estadoBoton
                        ? _logicaGestureDetector(widget.quiz, index)
                        : null,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: size.width * 0.08,
                        top: 20,
                        right: size.width * 0.08,
                      ),
                      decoration:
                          _getDecorationOutlineBorder(widget.quiz, index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _crearCheck(checks[index]),
                            Flexible(
                              child: Text(widget.quiz.tipo != 'relacionar'
                                  ? widget.quiz.respuestasposibles[index]
                                  : widget.quiz.respuestasposibles[index]
                                      .substring(2)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------- Logica background dependiendo dedl tipo de quiz ------------------ //

  BoxDecoration _getDecorationOutlineBorder(Quiz quiz, int index) {
    return BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
      color: quiz.tipo == 'relacionar'
          ? _getBackgroundRelacionar(quiz, index)
          : _getBackgroundVF(quiz, index),
    );
  }

  Color _getBackgroundVF(Quiz quiz, int index) {
    final List<String> resp =
        quiz.respuestascorrectas.map((resp) => resp.toLowerCase()).toList();
    final String respActual = quiz.respuestasposibles[index].toLowerCase();

    if (widget.estadoBoton) return Colors.white;
    if ((checks[index] == 'V' && resp.contains(respActual)) ||
        (checks[index] == 'F' && !resp.contains(respActual))) {
      return colorGreenAccent;
    }

    if ((checks[index] == 'V' && !resp.contains(respActual)) ||
        (checks[index] == 'F' && resp.contains(respActual))) {
      return Colors.red;
    }
    if (checks[index].isEmpty) {
      checks[index] = resp.contains(respActual) ? 'V' : 'F';
    }
    return Colors.white;
  }

  Color _getBackgroundRelacionar(Quiz quiz, int index) {
    if (widget.estadoBoton) return Colors.white;
    if (quiz.respuestasposibles[index][0] == checks[index]) {
      return colorGreenAccent;
    }
    if (checks[index].isNotEmpty &&
        quiz.respuestasposibles[index][0] != checks[index]) {
      return Colors.red;
    }
    if (checks[index].isEmpty) {
      checks[index] = quiz.respuestasposibles[index][0];
    }
    return Colors.white;
  }

// ------------------ Crear check ------------------------------ //
  Container _crearCheck(String value) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

//------------------ Logica gesture detector dependiendo si el quiz es v_f o  relacionar----------------------------- //
  void _logicaGestureDetector(Quiz quiz, int index) {
    if (quiz.tipo == 'v_f') _logicaGestureDetectorVF(index);
    if (quiz.tipo == 'relacionar') {
      _logicaGestureDetectorRelcacionar(quiz, index);
    }
  }

  void _logicaGestureDetectorRelcacionar(Quiz quiz, int index) {
    setState(() {
      if (checks[index].isEmpty) {
        checksInt[index] = 1;
      } else if (checksInt[index] == quiz.respuestascorrectas.length) {
        checksInt[index] = 1;
      } else {
        checksInt[index]++;
      }
      checks[index] = checksInt[index].toString();
    });
  }

  void _logicaGestureDetectorVF(int index) {
    setState(() {
      if (checks[index].isEmpty) {
        checks[index] = 'V';
      } else if (checks[index] == 'V') {
        checks[index] = 'F';
      } else {
        checks[index] = 'V';
      }
    });
  }
}
