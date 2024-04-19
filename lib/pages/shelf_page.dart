import 'package:flutter/material.dart';
import 'package:wx_reader_book/pages/book_reader_page.dart';
import 'book_reader.dart';

class ShelfPage extends StatelessWidget {
  const ShelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
      onPressed: () {
        Navigator.pushNamed(context, BookReaderPage.routeName,
            arguments: "assets/book/三字经.epub");
      },
      child: const Text('open the book'),
    ));
  }
}
