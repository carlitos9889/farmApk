import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/pages/home_page.dart';
import 'package:farmapk/pages/orientaciones_generales_page.dart';
import 'package:farmapk/pages/pdf_view_page.dart';
import 'package:farmapk/pages/quiz_for_theme.dart';
import 'package:farmapk/pages/theme_info_page.dart';
import 'package:farmapk/pages/theme_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouter getGoRouterApp() => GoRouter(
      debugLogDiagnostics: true,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'orientaciones',
              builder: (_, state) => const OrientacionesGeneralesPage(),
              pageBuilder: (context, state) => buildTransition<void>(
                context: context,
                state: state,
                child: const OrientacionesGeneralesPage(),
              ),
            ),
            GoRoute(
              path: 'pdf',
              builder: (_, state) => PdfViewPage(state.extra as String),
              pageBuilder: (context, state) => buildTransition<void>(
                context: context,
                state: state,
                child: PdfViewPage(state.extra as String),
              ),
            ),
            GoRoute(
              path: 'guias',
              builder: (_, state) =>
                  ThemePage(tema: state.extra as List<TemaGuia>),
              pageBuilder: (context, state) => buildTransition<void>(
                context: context,
                state: state,
                child: ThemePage(tema: state.extra as List<TemaGuia>),
              ),
              routes: [
                GoRoute(
                  path: ':index',
                  builder: (context, state) {
                    final index = int.parse(state.params['index']!);
                    final temas = state.extra as List<TemaGuia>;
                    return ThemeInfoPage(temas: temas, index: index);
                  },
                  pageBuilder: (context, state) => buildTransition(
                    context: context,
                    state: state,
                    child: ThemeInfoPage(
                      temas: state.extra as List<TemaGuia>,
                      index: int.parse(state.params['index']!),
                    ),
                  ),
                ),
              ],
            ),
            GoRoute(
              path: 'quiz',
              builder: (context, state) => QuizForThemePage(
                dataTema: state.extra as DataTema,
              ),
              pageBuilder: (context, state) => buildTransition(
                context: context,
                state: state,
                child: QuizForThemePage(dataTema: state.extra as DataTema),
              ),
            ),
          ],
        ),
      ],
    );

CustomTransitionPage buildTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
