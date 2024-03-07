import 'package:flutter/material.dart';
import 'package:wx_reader_book/widgets/one_book_card.dart';
import 'package:wx_reader_book/widgets/recommend_card.dart';
import '../widgets/search_bar.dart';

class DiscoverPage extends StatelessWidget{
   const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    children: [
      CustomSearchBar(rightButton: Text('书城',style: TextStyle(fontSize: 11,color: Colors.black45,fontWeight: FontWeight.bold),)),
      RecommendCard(),
      OneBookCard()
    ],
    );
  }

}