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
      appBar: AppBar(
        leadingWidth: 120,
        leading: IconButton(
          icon: Row(
            children: const [
              Icon(Icons.arrow_back),
              Text('Atrás', style: TextStyle(fontSize: 20)),
            ],
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PdfViewPinch(controller: pdf),
    );
  }
}
