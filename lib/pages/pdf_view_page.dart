import 'package:farmapk/models/document_model.dart';
import 'package:farmapk/styles/estilos_app.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

// ignore: must_be_immutable
class PdfViewScreen extends StatefulWidget {
  const PdfViewScreen({Key? key}) : super(key: key);

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  @override
  Widget build(BuildContext context) {
    final String pathBook =
        ModalRoute.of(context)!.settings.arguments as String;

    final pdf = PdfControllerPinch(document: PdfDocument.openAsset(pathBook));

    return Scaffold(
      appBar: AppBar(title: const Text('Atrás')),
      body: PdfViewPinch(controller: pdf),
    );
  }
}
