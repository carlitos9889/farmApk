import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/tests/quiz_chek_generic.dart';
import 'package:farmapk/widgets/tests/quiz_seleccionar.dart';
import 'package:flutter/material.dart';

class QuizForTheme extends StatefulWidget {
  const QuizForTheme({Key? key}) : super(key: key);

  @override
  State<QuizForTheme> createState() => _QuizForThemeState();
}

class _QuizForThemeState extends State<QuizForTheme> {
  late SwiperController pController;
  int currentPage = 0;
  bool estadoBoton = false;

  @override
  void initState() {
    super.initState();
    pController = SwiperController();
    pController.addListener(() {
      setState(() => currentPage = pController.index);
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
      appBar: AppBar(title: const Text('Atrás'), leadingWidth: 20),
      body: Stack(
        children: [
          Swiper(
            itemCount: dataTema.quiz.length,
            itemBuilder: (context, i) {
              if (dataTema.quiz[i].tipo == 'seleccionar') {
                return QuizSeleccionar(
                    quiz: dataTema.quiz[i], estadoBoton: estadoBoton);
              } else if (dataTema.quiz[i].tipo == 'v_f') {
                return QuizCheckGenerico(
                    quiz: dataTema.quiz[i], estadoBoton: estadoBoton);
              } else {
                return Center(
                  child: Align(
                    child: Text(
                      dataTema.quiz[i].orden,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            },
            onIndexChanged: _onIndexChanged,
            controller: SwiperController(),
            control: const SwiperControl(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: _styleButton(),
                onPressed: !estadoBoton ? _revisarRespuesta : null,
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

  void _onIndexChanged(int value) {
    setState(() {
      if (value != currentPage) {
        estadoBoton = false;
      }
      currentPage = value;
    });
  }

  void _revisarRespuesta() {
    setState(() => estadoBoton = true);
  }

  ButtonStyle _styleButton() => ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        maximumSize: const Size(250, 50),
      );
}
