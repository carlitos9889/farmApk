// ignore_for_file: must_be_immutable

import 'package:farmapk/helpers/get_icons.dart';
import 'package:farmapk/models/document_model.dart';
import 'package:farmapk/widgets/book/book_info.dart';
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

// Imagen de portada de la tarjeta del libro
class _CreateImageBook extends StatelessWidget {
  const _CreateImageBook({
    Key? key,
    required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        child: Image.asset(
          book.imagen,
          height: size.width < sizePre ? 130 : 150,
          width: 100,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

// Coloca la icono en la parte superior de la tarjeta
class _CreateIconBook extends StatelessWidget {
  const _CreateIconBook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Icon(Icons.bookmark, color: Color(0xff1A86C7), size: 18),
        SizedBox(height: size.width < sizePre ? 100 : 130)
      ],
    );
  }
}

// Crea el cascaron de la tarjeta del libro
class _CreateCardBook extends StatelessWidget {
  const _CreateCardBook({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Card(
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.15),
      margin:
          EdgeInsets.symmetric(horizontal: size.width * 0.055, vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(33)),
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(size.width < sizePre ? 5 : 10),
            child: _CreateImageBook(book: book),
          ),
          BookInfo(book),
          const _CreateIconBook(),
        ],
      ),
    );
  }
}
