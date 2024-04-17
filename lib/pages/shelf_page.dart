import 'package:flutter/material.dart';
import 'book_reader.dart';

class ShelfPage extends StatelessWidget{
  const ShelfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BookReader(
              bookUrl:"assets/book/三字经.epub"
            ))
          );
        }, child: const Text('open the book'),
      )
    );
  }

}