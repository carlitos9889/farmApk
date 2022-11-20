import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/widgets/tests/quiz_chek_generic.dart';
import 'package:farmapk/widgets/tests/quiz_seleccionar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizForThemePage extends StatefulWidget {
  const QuizForThemePage({Key? key, required this.dataTema}) : super(key: key);
  final DataTema dataTema;

  @override
  State<QuizForThemePage> createState() => _QuizForThemePageState();
}

class _QuizForThemePageState extends State<QuizForThemePage> {
  late SwiperController pController;
  int currentPage = 0;
  bool estadoBoton = false;

  @override
  void initState() {
    super.initState();
    pController = SwiperController();
    cargarRef();
  }

  void cargarRef() async {
    final prefs = await SharedPreferences.getInstance();
    currentPage = prefs.getInt(widget.dataTema.tema) ?? 0;
    Future.delayed(
      const Duration(microseconds: 500),
      () {
        pController.move(currentPage, animation: true);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    pController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: IconButton(
          icon: Row(
            children: const [
              Icon(Icons.arrow_back),
              Text('Atrás', style: TextStyle(fontSize: 20)),
            ],
          ),
          onPressed: () => _showAlert(widget.dataTema),
        ),
      ),
      body: Stack(
        children: [
          Swiper(
            itemCount: widget.dataTema.quiz.length,
            itemBuilder: (context, i) {
              if (widget.dataTema.quiz[i].tipo == 'seleccionar') {
                return QuizSeleccionar(
                    quiz: widget.dataTema.quiz[i], estadoBoton: estadoBoton);
              } else if (widget.dataTema.quiz[i].tipo == 'v_f' ||
                  widget.dataTema.quiz[i].tipo == 'relacionar') {
                return QuizCheckGenerico(
                    quiz: widget.dataTema.quiz[i], estadoBoton: estadoBoton);
              } else {
                return Center(
                  child: Align(
                    child: Text(
                      widget.dataTema.quiz[i].tipo,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            },
            onIndexChanged: _onIndexChanged,
            controller: pController,
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
                        text:
                            ' ${currentPage + 1}/${widget.dataTema.quiz.length}'),
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

  void _showAlert(DataTema dataTema) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Desea guardar la sección'),
        actions: [
          TextButton(
              onPressed: () async {
                GoRouter.of(context).pop();
                final prefs = await SharedPreferences.getInstance();
                await prefs.setInt(dataTema.tema, currentPage);
              },
              child: const Text('Sí')),
          TextButton(
              onPressed: () async {
                GoRouter.of(context).pop();
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove(dataTema.tema);
              },
              child: const Text('No'))
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
