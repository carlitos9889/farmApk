import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/helpers/get_icons.dart';
import 'package:flutter/material.dart';

class OrientacionesGenerales extends StatelessWidget {
  const OrientacionesGenerales({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
      margin:
          EdgeInsets.only(left: size.width * 0.05, right: size.width * 0.08),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33.0)),
      elevation: 10,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.width < sizePre ? 10 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.description,
              size: size.width < sizePre ? 120 : 170,
              color: const Color.fromRGBO(181, 198, 159, 0.25),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  'Orientaciones\nGenerales',
                  minFontSize: 22,
                  maxFontSize: 25,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: size.width < sizePre ? 8 : 16),
                const _ButtomOrienetacionesGenerales(),
              ],
            ),
            const SizedBox(width: 8)
          ],
        ),
      ),
    );
  }
}

class _ButtomOrienetacionesGenerales extends StatelessWidget {
  const _ButtomOrienetacionesGenerales({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => Navigator.pushNamed(context, 'orientaciones'),
      color: const Color(0xff8CC63E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: AutoSizeText(
          'Comenzar',
          maxFontSize: 18,
          minFontSize: 16,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}