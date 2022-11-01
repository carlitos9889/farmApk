import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/pages/home_page.dart';
import 'package:farmapk/provider/logica_provider.dart';
import 'package:farmapk/widgets/tests/quiz_seleccionar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResolveQuizPage extends StatefulWidget {
  const ResolveQuizPage(
      {Key? key, required this.quizList, required this.numeroTema})
      : super(key: key);
  final List<Quiz> quizList;
  final int numeroTema;

  @override
  State<ResolveQuizPage> createState() => _ResolveQuizPageState();
}

class _ResolveQuizPageState extends State<ResolveQuizPage> {
  int numQuiz = 0;
  String txtButtom = 'Revisar';

  @override
  void initState() {
    cargarPref();
    super.initState();
  }

  cargarPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    numQuiz = preferences.getInt('tema${widget.numeroTema}') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final logicaProvider = Provider.of<LogicaProvider>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //------ Show quiz dependiendo del tipo ---------//
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: _escogerWidget(
                widget.quizList[numQuiz],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 40),
                // ------------- Show el progress del quiz y la cantidad de preguntas ------------//
                Container(
                  margin: const EdgeInsets.only(left: 15, bottom: 4),
                  child: Text(
                    'Pregunta: ${numQuiz + 1}/${widget.quizList.length}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 27),
                  ),
                ),

                const Expanded(child: SizedBox()),
                // ------------- Boton de revisar y pasar al siguinte quiz ---------------- //
                if (MediaQuery.of(context).viewInsets.bottom == 0)
                  ElevatedButton(
                    onPressed: () {
                      logicaProvider.estadoBotonCheck++;
                      _funcionalidadBoton(numQuiz);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(size.width * 0.72, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(txtButtom,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700)),
                  ),
                const SizedBox(height: 26),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _funcionalidadBoton(int index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      switch (txtButtom) {
        case 'Finalizar':
          Navigator.pop(context);
          numQuiz = 0;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
          break;

        case 'Siguiente':
          numQuiz++;
          txtButtom = 'Revisar';
          break;

        default:
          if (numQuiz == widget.quizList.length - 1) {
            txtButtom = 'Finalizar';
          } else {
            txtButtom = 'Siguiente';
          }
          break;
      }
    });
    await preferences.setInt('tema${widget.numeroTema}', numQuiz);
  }

  Widget _escogerWidget(Quiz quiz) {
    // final bool estadoBoton = txtButtom == 'Revisar' ? true : false;
    switch (quiz.tipo) {
      case 'seleccionar':
        return QuizSeleccionar(quiz: quiz, estadoBoton: true);
      case 'v_f':
        // return QuizCheckGenerico(quiz: quiz, estadoBoton: estadoBoton);
        return const Center(child: Text('En contruccion'));
      case 'completar':
        // return QuizCompletar(quiz: quiz, estadoBoton: estadoBoton);
        return const Center(child: Text('En contruccion'));
      case 'relacionar':
        // return QuizCheckGenerico(quiz: quiz, estadoBoton: estadoBoton);
        return const Center(child: Text('En contruccion'));
      default:
        return Container();
    }
  }
}
