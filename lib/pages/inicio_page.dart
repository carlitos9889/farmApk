import 'package:farmapk/models/document_model.dart';
import 'package:farmapk/widgets/book/card_book.dart';
import 'package:farmapk/widgets/start/card_orinetaciones_inicio.dart';
import 'package:farmapk/widgets/start/card_themes_inicio.dart';
import 'package:farmapk/widgets/start/header_inicio.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30.0),
              const OrientacionesGenerales(),
              const Header(txt: 'Temas'),
              const CardThemeShow(),
              const Header(txt: 'Bibliografía Principal'),
              CardBook(Book.docList.first),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
