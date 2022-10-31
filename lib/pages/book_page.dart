import 'package:farmapk/models/document_model.dart';
import 'package:farmapk/widgets/book/card_book.dart';
import 'package:flutter/material.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Book.docList.length,
      itemBuilder: (context, index) => CardBook(Book.docList[index]),
    );
  }
}
