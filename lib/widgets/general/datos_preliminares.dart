// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/helpers/get_icons.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:flutter/material.dart';

class Preliminares extends StatelessWidget {
  const Preliminares(this.preliminares, {Key? key}) : super(key: key);
  final List<Preliminare> preliminares;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const _HeaderOrientaciones(),
        _Preliminares(preliminares: preliminares),
      ],
    );
  }
}

class _Preliminares extends StatelessWidget {
  const _Preliminares({
    Key? key,
    required this.preliminares,
  }) : super(key: key);

  final List<Preliminare> preliminares;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(left: size.width * 0.2),
      child: Column(
        children: List.generate(
            preliminares.length, (i) => Preliminar(preliminares[i])),
      ),
    );
  }
}

class _HeaderOrientaciones extends StatelessWidget {
  const _HeaderOrientaciones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: size.width * 0.075, vertical: 24),
      child: const AutoSizeText(
        'Orientaciones Generales',
        maxFontSize: 25,
        minFontSize: 20,
        maxLines: 1,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      ),
    );
  }
}

// Widget Preliminar
class Preliminar extends StatelessWidget {
  const Preliminar(this.pre, {Key? key}) : super(key: key);
  final Preliminare pre;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            getIconPrelminar(pre.icon),
            const SizedBox(width: 7.0),
            Text(
              pre.preliminar,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 7.0),
            Text(
              pre.info,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
}
