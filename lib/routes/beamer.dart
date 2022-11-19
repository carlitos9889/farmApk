import 'package:beamer/beamer.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/pages/home_page.dart';
import 'package:farmapk/pages/orientaciones_generales_page.dart';
import 'package:farmapk/pages/pdf_view_page.dart';
import 'package:farmapk/pages/quiz_for_theme.dart';
import 'package:farmapk/pages/theme_info_page.dart';
import 'package:farmapk/pages/theme_page.dart';

BeamerDelegate getRoutesDelegate() {
  final $routerDelegate = BeamerDelegate(
    initializeFromParent: true,
    initialPath: '/',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (p0, p1, p2) => const HomePage(),
        '/orientaciones': (p0, p1, p2) => const BeamPage(
              name: 'orientaciones',
              popToNamed: '/',
              type: BeamPageType.slideLeftTransition,
              child: OrientacionesGeneralesPage(),
            ),
        '/pdf': (p0, p1, p2) => BeamPage(
              name: 'pdf',
              popToNamed: '/',
              type: BeamPageType.scaleTransition,
              child: PdfViewPage(p2 as String),
            ),
        '/guias': (p0, p1, p2) => BeamPage(
              name: 'guias',
              popToNamed: '/',
              type: BeamPageType.slideLeftTransition,
              child: ThemePage(tema: p2 as List<TemaGuia>),
            ),
        '/guias/:index': (p0, p1, p2) {
          final index = int.parse(p1.pathParameters['index']!);
          final temas = p2 as List<TemaGuia>;
          return BeamPage(
            name: 'guia',
            popToNamed: '/guias',
            type: BeamPageType.slideLeftTransition,
            child: ThemeInfoPage(temas: temas, index: index),
          );
        },
        '/quiz': (p0, p1, p2) => BeamPage(
              name: 'quiz',
              popToNamed: '/',
              type: BeamPageType.scaleTransition,
              child: QuizForThemePage(dataTema: p2 as DataTema),
            ),
      },
    ),
  );
  return $routerDelegate;
}
