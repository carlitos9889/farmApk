import 'package:auto_route/annotations.dart';
import 'package:farmapk/pages/book_page.dart';
import 'package:farmapk/pages/home_page.dart';
import 'package:farmapk/pages/inicio_page.dart';
import 'package:farmapk/pages/orientaciones_generales_page.dart';
import 'package:farmapk/pages/pdf_view_page.dart';
import 'package:farmapk/pages/quiz_for_theme.dart';
import 'package:farmapk/pages/test_page.dart';
import 'package:farmapk/pages/theme_info_page.dart';
import 'package:farmapk/pages/theme_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(page: HomePage, initial: true, children: [
      MaterialRoute(page: InicioPage),
      MaterialRoute(page: BooksPage),
      MaterialRoute(page: TestPage),
    ]),
    MaterialRoute(page: OrientacionesGeneralesPage, path: 'orientaciones'),
    MaterialRoute(page: ThemePage, path: 'guias'),
    MaterialRoute(page: ThemeInfoPage, path: 'guia'),
    MaterialRoute(page: PdfViewPage, path: 'pdf'),
    MaterialRoute(page: QuizForThemePage)
  ],
)
// extend the generated private router
class $AppRouter {}
