import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:flutter/material.dart';

class CardGuia extends StatelessWidget {
  const CardGuia(this.temaGuia, {Key? key}) : super(key: key);
  final TemaGuia temaGuia;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'temaInfo', arguments: temaGuia),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: _decoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 230, child: _TemaGuiaName(temaGuia: temaGuia)),
            const Expanded(child: SizedBox()),
            const _ImgGuia(),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xff1A86C7), Color.fromRGBO(2, 198, 116, 0.65)],
      ),
      borderRadius: BorderRadius.circular(30),
    );
  }
}

class _ImgGuia extends StatelessWidget {
  const _ImgGuia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      width: 70,
      image: AssetImage('assets/icon/icon-guia.png'),
      fit: BoxFit.cover,
    );
  }
}

class _TemaGuiaName extends StatelessWidget {
  const _TemaGuiaName({Key? key, required this.temaGuia}) : super(key: key);

  final TemaGuia temaGuia;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      temaGuia.temaGuia,
      maxFontSize: 23,
      minFontSize: 18,
      maxLines: 3,
      style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
    );
  }
}
