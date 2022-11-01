import 'package:farmapk/pages/home_page.dart';
import 'package:farmapk/pages/orientaciones_generales_page.dart';
import 'package:farmapk/pages/pdf_view_page.dart';
import 'package:farmapk/pages/quiz_for_theme.dart';
import 'package:farmapk/pages/theme_info_page.dart';
import 'package:farmapk/pages/theme_page.dart';
import 'package:flutter/material.dart';

class RoutesApp {
  static Map<String, WidgetBuilder> getRoutes() => {
        '/': (context) => const HomePage(),
        'orientaciones': (context) => const OrientacionesGeenrales(),
        'guias': (context) => const ThemePage(),
        'temaInfo': (context) => const ThemeInfoPage(),
        'pdf': (context) => const PdfViewScreen(),
        'quiz': (context) => const QuizForTheme()
      };
}
