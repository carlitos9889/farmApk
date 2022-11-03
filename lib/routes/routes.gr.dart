// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../models/data_json.dart' as _i12;
import '../pages/book_page.dart' as _i8;
import '../pages/home_page.dart' as _i1;
import '../pages/inicio_page.dart' as _i7;
import '../pages/orientaciones_generales_page.dart' as _i2;
import '../pages/pdf_view_page.dart' as _i5;
import '../pages/quiz_for_theme.dart' as _i6;
import '../pages/test_page.dart' as _i9;
import '../pages/theme_info_page.dart' as _i4;
import '../pages/theme_page.dart' as _i3;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    OrientacionesGeneralesRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.OrientacionesGeneralesPage(),
      );
    },
    ThemeRoute.name: (routeData) {
      final args = routeData.argsAs<ThemeRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ThemePage(
          key: args.key,
          tema: args.tema,
        ),
      );
    },
    ThemeInfoRoute.name: (routeData) {
      final args = routeData.argsAs<ThemeInfoRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ThemeInfoPage(
          key: args.key,
          guia: args.guia,
        ),
      );
    },
    PdfViewRoute.name: (routeData) {
      final args = routeData.argsAs<PdfViewRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.PdfViewPage(
          args.pathBook,
          key: args.key,
        ),
      );
    },
    QuizForThemeRoute.name: (routeData) {
      final args = routeData.argsAs<QuizForThemeRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.QuizForThemePage(
          key: args.key,
          dataTema: args.dataTema,
        ),
      );
    },
    InicioRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.InicioPage(),
      );
    },
    BooksRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.BooksPage(),
      );
    },
    TestRoute.name: (routeData) {
      final args = routeData.argsAs<TestRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.TestPage(
          key: args.key,
          dataTemas: args.dataTemas,
        ),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i10.RouteConfig(
              InicioRoute.name,
              path: 'inicio-page',
              parent: HomeRoute.name,
            ),
            _i10.RouteConfig(
              BooksRoute.name,
              path: 'books-page',
              parent: HomeRoute.name,
            ),
            _i10.RouteConfig(
              TestRoute.name,
              path: 'test-page',
              parent: HomeRoute.name,
            ),
          ],
        ),
        _i10.RouteConfig(
          OrientacionesGeneralesRoute.name,
          path: 'orientaciones',
        ),
        _i10.RouteConfig(
          ThemeRoute.name,
          path: 'guias',
        ),
        _i10.RouteConfig(
          ThemeInfoRoute.name,
          path: 'guia',
        ),
        _i10.RouteConfig(
          PdfViewRoute.name,
          path: 'pdf',
        ),
        _i10.RouteConfig(
          QuizForThemeRoute.name,
          path: '/quiz-for-theme-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.OrientacionesGeneralesPage]
class OrientacionesGeneralesRoute extends _i10.PageRouteInfo<void> {
  const OrientacionesGeneralesRoute()
      : super(
          OrientacionesGeneralesRoute.name,
          path: 'orientaciones',
        );

  static const String name = 'OrientacionesGeneralesRoute';
}

/// generated route for
/// [_i3.ThemePage]
class ThemeRoute extends _i10.PageRouteInfo<ThemeRouteArgs> {
  ThemeRoute({
    _i11.Key? key,
    required _i12.DataTema tema,
  }) : super(
          ThemeRoute.name,
          path: 'guias',
          args: ThemeRouteArgs(
            key: key,
            tema: tema,
          ),
        );

  static const String name = 'ThemeRoute';
}

class ThemeRouteArgs {
  const ThemeRouteArgs({
    this.key,
    required this.tema,
  });

  final _i11.Key? key;

  final _i12.DataTema tema;

  @override
  String toString() {
    return 'ThemeRouteArgs{key: $key, tema: $tema}';
  }
}

/// generated route for
/// [_i4.ThemeInfoPage]
class ThemeInfoRoute extends _i10.PageRouteInfo<ThemeInfoRouteArgs> {
  ThemeInfoRoute({
    _i11.Key? key,
    required _i12.TemaGuia guia,
  }) : super(
          ThemeInfoRoute.name,
          path: 'guia',
          args: ThemeInfoRouteArgs(
            key: key,
            guia: guia,
          ),
        );

  static const String name = 'ThemeInfoRoute';
}

class ThemeInfoRouteArgs {
  const ThemeInfoRouteArgs({
    this.key,
    required this.guia,
  });

  final _i11.Key? key;

  final _i12.TemaGuia guia;

  @override
  String toString() {
    return 'ThemeInfoRouteArgs{key: $key, guia: $guia}';
  }
}

/// generated route for
/// [_i5.PdfViewPage]
class PdfViewRoute extends _i10.PageRouteInfo<PdfViewRouteArgs> {
  PdfViewRoute({
    required String pathBook,
    _i11.Key? key,
  }) : super(
          PdfViewRoute.name,
          path: 'pdf',
          args: PdfViewRouteArgs(
            pathBook: pathBook,
            key: key,
          ),
        );

  static const String name = 'PdfViewRoute';
}

class PdfViewRouteArgs {
  const PdfViewRouteArgs({
    required this.pathBook,
    this.key,
  });

  final String pathBook;

  final _i11.Key? key;

  @override
  String toString() {
    return 'PdfViewRouteArgs{pathBook: $pathBook, key: $key}';
  }
}

/// generated route for
/// [_i6.QuizForThemePage]
class QuizForThemeRoute extends _i10.PageRouteInfo<QuizForThemeRouteArgs> {
  QuizForThemeRoute({
    _i11.Key? key,
    required _i12.DataTema dataTema,
  }) : super(
          QuizForThemeRoute.name,
          path: '/quiz-for-theme-page',
          args: QuizForThemeRouteArgs(
            key: key,
            dataTema: dataTema,
          ),
        );

  static const String name = 'QuizForThemeRoute';
}

class QuizForThemeRouteArgs {
  const QuizForThemeRouteArgs({
    this.key,
    required this.dataTema,
  });

  final _i11.Key? key;

  final _i12.DataTema dataTema;

  @override
  String toString() {
    return 'QuizForThemeRouteArgs{key: $key, dataTema: $dataTema}';
  }
}

/// generated route for
/// [_i7.InicioPage]
class InicioRoute extends _i10.PageRouteInfo<void> {
  const InicioRoute()
      : super(
          InicioRoute.name,
          path: 'inicio-page',
        );

  static const String name = 'InicioRoute';
}

/// generated route for
/// [_i8.BooksPage]
class BooksRoute extends _i10.PageRouteInfo<void> {
  const BooksRoute()
      : super(
          BooksRoute.name,
          path: 'books-page',
        );

  static const String name = 'BooksRoute';
}

/// generated route for
/// [_i9.TestPage]
class TestRoute extends _i10.PageRouteInfo<TestRouteArgs> {
  TestRoute({
    _i11.Key? key,
    required List<_i12.DataTema> dataTemas,
  }) : super(
          TestRoute.name,
          path: 'test-page',
          args: TestRouteArgs(
            key: key,
            dataTemas: dataTemas,
          ),
        );

  static const String name = 'TestRoute';
}

class TestRouteArgs {
  const TestRouteArgs({
    this.key,
    required this.dataTemas,
  });

  final _i11.Key? key;

  final List<_i12.DataTema> dataTemas;

  @override
  String toString() {
    return 'TestRouteArgs{key: $key, dataTemas: $dataTemas}';
  }
}
