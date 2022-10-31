// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:farmapk/helpers/get_icons.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardThemeShow extends StatelessWidget {
  const CardThemeShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DataTema> temas =
        Provider.of<DataJsonPRovider>(context).datajson.temas;
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return _CardTheme(temas[index]);
        },
        itemCount: temas.length,
        pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
          color: Color(0xff1A86C7),
          activeColor: Color.fromRGBO(62, 198, 116, 0.65),
        )),
      ),
    );
  }
}

class _CardTheme extends StatelessWidget {
  final DataTema tema;
  const _CardTheme(this.tema, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'guias', arguments: tema),
      child: Card(
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Center(child: _RowImageAndTheme(tema: tema)),
      ),
    );
  }
}

class _RowImageAndTheme extends StatelessWidget {
  const _RowImageAndTheme({
    Key? key,
    required this.tema,
  }) : super(key: key);

  final DataTema tema;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          _CardThemeImage(tema: tema),
          const SizedBox(width: 10),
          _TextThemeName(tema: tema),
        ],
      ),
    );
  }
}

class _TextThemeName extends StatelessWidget {
  const _TextThemeName({
    Key? key,
    required this.tema,
  }) : super(key: key);

  final DataTema tema;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AutoSizeText(
        tema.tema,
        style: const TextStyle(fontWeight: FontWeight.w500),
        maxFontSize: 20,
        minFontSize: 17,
        maxLines: 4,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _CardThemeImage extends StatelessWidget {
  const _CardThemeImage({Key? key, required this.tema}) : super(key: key);

  final DataTema tema;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return CircleAvatar(
      backgroundImage: AssetImage(tema.img),
      radius: size.width < sizePre ? 35 : 40,
    );
  }
}
