import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/styles/estilos_app.dart';
import 'package:farmapk/widgets/tests/armar_evaluacion.dart';
import 'package:flutter/material.dart';

class QuizSeleccionar extends StatefulWidget {
  const QuizSeleccionar(
      {Key? key, required this.quiz, required this.estadoBoton})
      : super(key: key);
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
    if (checks.isEmpty) {
      checks =
          List.generate(widget.quiz.respuestasposibles.length, (_) => false);
    }
  }

  @override
  void dispose() {
    super.dispose();
    checks.clear();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: List.generate(
          widget.quiz.respuestasposibles.length,
          (i) => _listTitle(size, i),
        )..insert(0, OrdeQuiz(quiz: widget.quiz)),
      ),
    );
  }

  Container _listTitle(Size size, int i) {
    return Container(
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        top: 20,
        right: size.width * 0.08,
      ),
      decoration: BoxDecoration(
        color: _getColorBackground(widget.quiz, i),
        border: Border.all(
          color: _getColorBorder(widget.quiz, i),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CheckboxListTile(
        activeColor: !widget.estadoBoton ? colorGreenAccent : Colors.white,
        controlAffinity: ListTileControlAffinity.leading,
        value: checks[i],
        title: Text(
          widget.quiz.respuestasposibles[i],
          style: const TextStyle(color: Colors.black),
        ),
        onChanged: (value) {
          setState(() {
            checks[i] = value!;
          });
        },
      ),
    );
  }

  Color _getColorBorder(Quiz quiz, int i) {
    // ------- Estado de seleccionar respuesta ---------- //
    final List<String> resp =
        quiz.respuestascorrectas.map((resp) => resp.toLowerCase()).toList();
    final String respActual = quiz.respuestasposibles[i].toLowerCase();

    if (!widget.estadoBoton) {
      return checks[i] ? colorAmbar : colorGreenLightLight;
      // ------- Estado de revisar y la respuesta es correcta --------- //
    } else if (checks[i] && resp.contains(respActual)) {
      return colorGreenAccent;
      // ------- Estado de revisar y la respuesta es incorrecta --------- //
    } else if (checks[i] && !resp.contains(respActual)) {
      return Colors.red;
      // ------- Estado de revisar y la respuesta correcta no es seleccionada --------- //
    } else if (!checks[i] && resp.contains(respActual)) {
      return colorGreenAccent;
    } else {
      return Colors.grey;
    }
  }

  _getColorBackground(Quiz quiz, int i) {
    final List<String> resp =
        quiz.respuestascorrectas.map((resp) => resp.toLowerCase()).toList();
    final String respActual = quiz.respuestasposibles[i].toLowerCase();
    if (!widget.estadoBoton) {
      return Colors.white;
      // ------- Estado de revisar y la respuesta es correcta --------- //
    } else if (checks[i] && resp.contains(respActual)) {
      return colorGreenAccent;
      // ------- Estado de revisar y la respuesta es incorrecta --------- //
    } else if (checks[i] && !resp.contains(respActual)) {
      return Colors.red;
      // ------- Estado de revisar y la respuesta correcta no es seleccionada --------- //
    } else if (!checks[i] && resp.contains(respActual)) {
      return colorGreenLight;
    } else {
      return Colors.transparent;
    }
  }
}
