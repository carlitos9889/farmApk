import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/styles/estilos_app.dart';
import 'package:farmapk/widgets/tests/armar_evaluacion.dart';
import 'package:flutter/material.dart';

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
  bool touch = false;
  @override
  void initState() {
    super.initState();
    checks = List.generate(widget.quiz.respuestasposibles.length, (_) => '');
    checksInt = List.generate(widget.quiz.respuestasposibles.length, (_) => 0);
    opciones = widget.quiz.respuestascorrectas
        .map((e) {
          index++;
          return '$index. $e';
        })
        .toList()
        .join('');
  }

  @override
  void dispose() {
    super.dispose();
    checks.clear();
    index = 0;
    checksInt.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: widget.quiz.tipo == 'v_f'
            ? ListView(
                children: List.generate(
                  widget.quiz.respuestasposibles.length,
                  (i) => _listTitleChecks(size, i),
                )
                  ..insert(0, OrdeQuiz(quiz: widget.quiz))
                  ..add(const SizedBox(height: 70)),
              )
            : ListView(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, top: 100),
                    child: Text(opciones, textAlign: TextAlign.center),
                  ),
                  Column(
                    children: List.generate(
                      widget.quiz.respuestasposibles.length,
                      (i) => _listTitleChecks(size, i),
                    ),
                  ),
                ],
              ));
  }

  GestureDetector _listTitleChecks(Size size, int i) {
    if (!touch) {
      checks = List.generate(widget.quiz.respuestasposibles.length, (_) => '');
      checksInt =
          List.generate(widget.quiz.respuestasposibles.length, (_) => 0);
    }
    return GestureDetector(
      onTap: () =>
          !widget.estadoBoton ? _logicaGestureDetector(widget.quiz, i) : null,
      child: Container(
        margin: EdgeInsets.only(
          left: size.width * 0.08,
          top: 20,
          right: size.width * 0.08,
        ),
        decoration: _getDecorationOutlineBorder(widget.quiz, i),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _crearCheck(checks[i]),
              Flexible(
                child: Text(widget.quiz.tipo != 'relacionar'
                    ? widget.quiz.respuestasposibles[i]
                    : widget.quiz.respuestasposibles[i].substring(2)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------- Logica background dependiendo dedl tipo de quiz ------------------ //

  BoxDecoration _getDecorationOutlineBorder(Quiz quiz, int i) {
    return BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
      color: quiz.tipo == 'relacionar'
          ? _getBackgroundRelacionar(quiz, i)
          : _getBackgroundVF(quiz, i),
    );
  }

  Color _getBackgroundVF(Quiz quiz, int index) {
    final List<String> resp =
        quiz.respuestascorrectas.map((resp) => resp.toLowerCase()).toList();
    final String respActual = quiz.respuestasposibles[index].toLowerCase();

    if (!widget.estadoBoton) return Colors.white;
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
    if (!widget.estadoBoton) return Colors.white;
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
    touch = true;
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
