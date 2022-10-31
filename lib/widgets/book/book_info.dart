// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:farmapk/helpers/get_icons.dart';
import 'package:farmapk/models/document_model.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  BookInfo(this.book, {Key? key}) : super(key: key);
  Book? book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BookTitle(book: book),
          _BookAutor(book: book),
          _BookEdition(book: book),
        ],
      ),
    );
  }
}

class _BookEdition extends StatelessWidget {
  const _BookEdition({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book? book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 26),
      child: Row(
        children: [
          const Icon(Icons.menu_book, size: 17, color: Color(0xffB5C69F)),
          const SizedBox(width: 6),
          Text(
            book!.edicion,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Color(0xffB5C69F),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookAutor extends StatelessWidget {
  const _BookAutor({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book? book;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Text(
        book!.autor,
        style: TextStyle(
          fontSize: size.width < sizePre ? 10 : 13,
          fontWeight: FontWeight.w400,
          color: const Color(0xff85A659),
        ),
      ),
    );
  }
}

class _BookTitle extends StatelessWidget {
  const _BookTitle({Key? key, required this.book}) : super(key: key);

  final Book? book;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      book!.docTitle,
      minFontSize: 24,
      maxFontSize: 36,
      maxLines: 4,
      style: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}
