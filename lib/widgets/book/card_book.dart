// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/helpers/get_icons.dart';
import 'package:farmapk/models/document_model.dart';
import 'package:flutter/material.dart';

// tarjeta de libro
class CardBook extends StatelessWidget {
  CardBook(this.book, {Key? key}) : super(key: key);
  Book book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'pdf', arguments: book.docPath),
      child: _CreateCardBook(book: book),
    );
  }
}

class _CreateCardBook extends StatelessWidget {
  const _CreateCardBook({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;

    return Card(
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
      margin: EdgeInsets.symmetric(horizontal: size * 0.055, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_book(size), const SizedBox(width: 6), _info(size)],
            ),
            Positioned(right: 0, child: _icon()),
          ],
        ),
      ),
    );
  }

  Icon _icon() => const Icon(
        Icons.bookmark,
        color: Color(0xff1A86C7),
        size: 18,
      );

  SizedBox _info(double size) => SizedBox(
        width: size < sizePre ? 150 : 190,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            _title(size),
            const SizedBox(height: 10),
            _autor(size),
            _edition()
          ],
        ),
      );

  AutoSizeText _autor(double size) => AutoSizeText(
        book.autor,
        minFontSize: 8,
        maxFontSize: 15,
        maxLines: 1,
        style: TextStyle(
          fontSize: size < sizePre ? 10 : 13,
          fontWeight: FontWeight.w300,
          color: const Color(0xff85A659),
        ),
      );

  AutoSizeText _title(double size) => AutoSizeText(
        book.docTitle,
        minFontSize: size < sizePre ? 18 : 21,
        maxFontSize: 26,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.w500),
      );

  Row _edition() {
    return Row(
      children: [
        const Icon(Icons.menu_book, size: 17, color: Color(0xffB5C69F)),
        const SizedBox(width: 6),
        AutoSizeText(
          book.edicion,
          minFontSize: 8,
          maxFontSize: 12,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xffB5C69F),
          ),
        ),
      ],
    );
  }

  ClipRRect _book(double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: 95,
        child: Image.asset(book.imagen, height: 150, fit: BoxFit.fill),
      ),
    );
  }
}
