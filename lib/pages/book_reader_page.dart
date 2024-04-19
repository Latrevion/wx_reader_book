import 'package:flutter/material.dart';
import 'package:wx_reader_book/bloc/base_bloc.dart';
import 'package:wx_reader_book/pages/base_page.dart';
import 'package:wx_reader_book/pages/book_reader.dart';

class BookReaderPage extends BasePage<BookReaderPageBloc> {
  static const String routeName = "/bookReader";

  @override
  Widget buildPage(BuildContext context) {
    final bookUrl = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        body: GestureDetector(
      child: BookReader(bookUrl: bookUrl),
      onTap: () {
        showMenu(context);
      },
    ));
  }

  @override
  BookReaderPageBloc createBloc(BuildContext context) {
    return BookReaderPageBloc(StateLoading());
  }

  void showMenu(BuildContext context) {
    showDialog(
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 59,
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 20,left: 12,right: 12),
                  child:   const Row(
                   children:[ Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black45,
                      size: 15,),
                   Expanded(child: SizedBox()),
                     Icon(
                       Icons.bookmark_add,
                       color: Colors.black45,
                       size: 15,
                     ),
                     SizedBox(width: 10,),
                     Icon(Icons.shopping_cart,color: Colors.black45,size: 15,),
                     SizedBox(width: 10,),
                     Icon(Icons.person,color: Colors.black45,size: 15,),
                     SizedBox(width: 10,),
                     Icon(Icons.ios_share,color: Colors.black45,size: 15,),
                     SizedBox(width: 10,),
                     Icon(Icons.more_vert,color: Colors.black45,size: 15,),
                   ]
                  )
                ),
                Expanded(
                  child: GestureDetector(child: Container(color: Colors.transparent,),onTap: ()=>Navigator.pop(
                      context),),
                ),
                Container(
                  width: double.infinity,
                  height: 59,
                  color: Colors.white,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.density_medium,color: Colors.black45,size: 15,),
                      Icon(Icons.toggle_off_outlined,color: Colors.black45,size: 15,),
                      Icon(Icons.wb_sunny_outlined,color: Colors.black45,size: 15,),
                      Icon(Icons.font_download_outlined,color: Colors.black45,size: 15,),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

class BookReaderPageBloc extends BaseBloc<BaseBlocState> {
  BookReaderPageBloc(super.initalState);
}
