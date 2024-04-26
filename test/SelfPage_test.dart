
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wx_reader_book/bean/User.dart';
import 'package:wx_reader_book/bloc/base_bloc.dart';
import 'package:wx_reader_book/bloc/self_page_bloc.dart';
import 'package:wx_reader_book/main.dart';
import 'package:wx_reader_book/pages/self_page.dart';

import 'TestApp.dart';
import 'test_common.dart';

void main() {
  initTest();

  testWidgets('Bloc StateData status page show username', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( TestApp( TestSelfPage()));

    expect(find.text('luke'), findsOneWidget);

  });
}

class TestSelfPage extends SelfPage{
   TestSelfPage({super.key});

  @override
  SelfPageBloc createBloc(BuildContext context) {
    return TestSelfPageBloc();
  }
}

class TestSelfPageBloc extends SelfPageBloc{
  @override
  Future<void> loadData() async {
      user = User.fromJson(json.decode(userJsonStr));
      emitState(StateData());
  }

  var userJsonStr = '''{
  "username":"six",
  "nickname":"luke",
  "userId":"123456789",
  "avatarUrl":"https://c-ssl.dtstatic.com/uploads/blog/202201/23/20220123222213_2899a.thumb.400_0.jpeg",
  "token":"c7c53812312312312312312",
  "balance":9.32,
  "pricePerMonth":9,
  "purchasedBooksCount":10,
  "followersCount":100,
  "readingCount":50,
  "readingTime":12000,
  "notesCount":20,
  "booksReadCount":30,
  "likesCOunt":50,
  "booklistsCount":5,
  "ranking":3
}''';

}