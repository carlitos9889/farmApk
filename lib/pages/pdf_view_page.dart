import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

// ignore: must_be_immutable
class PdfViewPage extends StatefulWidget {
  const PdfViewPage(this.pathBook, {Key? key}) : super(key: key);
  final String pathBook;

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  @override
  Widget build(BuildContext context) {
    final pdf =
        PdfControllerPinch(document: PdfDocument.openAsset(widget.pathBook));

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
          onPressed: () => AutoRouter.of(context).pop(),
        ),
      ),
      body: PdfViewPinch(controller: pdf),
    );
  }
}
