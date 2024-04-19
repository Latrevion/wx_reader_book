import 'dart:typed_data';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';
import 'package:epub_view/src/data/epub_parser.dart';
import 'package:flutter/services.dart';

class BookReader extends StatefulWidget{
  final String bookUrl;

  const BookReader({super.key,required this.bookUrl});

  @override
  State<StatefulWidget> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  late EpubController _epubController;
  int paragraphCount= 0;

  @override
  void initState() {
    super.initState();
    _epubController = EpubController(
      // Load document
      document: EpubDocument.openAsset(widget.bookUrl),
      // Set start point
      // epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );
  }

  @override
  Widget build(BuildContext context) {
    //hide the top status
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    

      return Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            //title
            EpubViewActualChapter(controller: _epubController, builder:(chapterValue)=>Align(
              alignment: Alignment.centerLeft,
              child: Text(
                chapterValue?.chapter?.Title?.replaceAll('\n','').trim()??'',
                style: const TextStyle(
                  fontSize: 6,
                  color: Color(0xff88898f)
                ),
              ),
            )),
            const SizedBox(height: 12,),

            //content
            Expanded(
              child:
            EpubView(
              controller: _epubController,
              onDocumentLoaded: (document){
                //content load success,Calculate the total
                var _chapters =parseChapters(document!);
                final parseParagraphsResult= parseParagraphs(_chapters, document!.Content);
                var paragraphs= parseParagraphsResult.flatParagraphs;
                paragraphCount = paragraphs.length;
              },
              builders:   EpubViewBuilders<DefaultBuilderOptions>(
                  //remove the chapters title content
                 chapterDividerBuilder: (value) => const SizedBox(height: 0,),
                  options: DefaultBuilderOptions(
                  textStyle: TextStyle(
                      height: 1.25,
                      fontSize: 16,
                    color: Colors.black
                  )
              )),
            ),
            ),
            const SizedBox(height: 20,),
            //pagination
            EpubViewActualChapter(
                controller: _epubController,
                builder:(chapterValue)=>Align(
              alignment: Alignment.centerRight,
              child: Text(
                "${chapterValue?.position.index}/$paragraphCount",
                style: const TextStyle(
                    fontSize: 6,
                    color: Color(0xff88898f)
                ),
              ),
            )),
          ],
        ),
      );



/*    return Scaffold(
    appBar: AppBar(
      // Show actual chapter name
      title: EpubViewActualChapter(
          controller: _epubController,
          builder: (chapterValue) {
            print('chapterValue?.chapter => ${chapterValue?.chapter}');
            print('chapterValue?.position => ${chapterValue?.position}');
            print('chapterValue chapterNumber => ${chapterValue?.chapterNumber}');
            print('chapterValue paragraphNumber => ${chapterValue?.paragraphNumber}');
            return Text(
            'Chapter: ' + (chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? ''),
            textAlign: TextAlign.start,
          );
          }
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
      onDocumentLoaded: (document){
        var _chapters =parseChapters(document);
        final parseParagraphsResult= parseParagraphs(_chapters, document!.Content);
        var _paragraphs= parseParagraphsResult.flatParagraphs;
      },
      builders: const EpubViewBuilders<DefaultBuilderOptions>(options: DefaultBuilderOptions(
        textStyle: TextStyle(
          height: 1.25,
          fontSize: 26
        )
      )),
    ),
  );*/
  }
}