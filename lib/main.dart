import 'package:farmapk/provider/data_provider.dart';
import 'package:farmapk/provider/logica_provider.dart';
import 'package:farmapk/routes/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataJsonPRovider()),
        ChangeNotifierProvider(create: (context) => LogicaProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      theme: ThemeData(
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(62, 198, 116, 0.65),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: getGoRouterApp(),
    );
  }
}
