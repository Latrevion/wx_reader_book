import 'dart:typed_data';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';

class BookReader extends StatefulWidget{
  final String bookUrl;

  const BookReader({super.key,required this.bookUrl});

  @override
  State<StatefulWidget> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  late EpubController _epubController;

  @override
  void initState() {
    super.initState();
    _epubController = EpubController(
      // Load document
      document: EpubDocument.openAsset(widget.bookUrl),
      // Set start point
      epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      // Show actual chapter name
      title: EpubViewActualChapter(
          controller: _epubController,
          builder: (chapterValue) => Text(
            'Chapter: ' + (chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? ''),
            textAlign: TextAlign.start,
          )
      ),
    ),
    // Show table of contents
    drawer: Drawer(
      child: EpubViewTableOfContents(
        controller: _epubController,
      ),
    ),
    // Show epub document
    body: EpubView(
      controller: _epubController,
    ),
  );
}