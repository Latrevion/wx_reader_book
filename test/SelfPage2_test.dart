
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wx_reader_book/bean/User.dart';
import 'package:wx_reader_book/bloc/base_bloc.dart';
import 'package:wx_reader_book/data_repository/repository.dart';
import 'package:wx_reader_book/pages/self_page2.dart';
import 'package:wx_reader_book/widgets/loading_widget.dart';
import 'SelfPage2_test.mocks.dart';
import 'SelfPageBloc_test.mocks.dart';
import 'TestApp.dart';
import 'test_common.dart';

@GenerateNiceMocks([MockSpec<SelfPage2Bloc>(),MockSpec<Repository>()])
void main(){
  initTest();

  group('Page started, no data has been loaded', () {
    testWidgets('show loading component', (widgetTester) async {
      var page =SelfPage2();
      var testBloc =MockSelfPage2Bloc();
      page.setTestBloc(testBloc);

      await widgetTester.pumpWidget(TestApp(page));
      var loadingWidgetFinder = find.byType(LoadingWidget);
      expect(loadingWidgetFinder, findsOneWidget);
    });

    testWidgets('Start loading data', (widgetTester) async {
      var page =SelfPage2();
      var testBloc =MockSelfPage2Bloc();
      page.setTestBloc(testBloc);

      await widgetTester.pumpWidget(TestApp(page));

      verify(testBloc.loadData());
    });
  });

  group("SelfPage2Bloc Business logic ", () {
    test('The default status is loading', () {
        var bloc =SelfPage2Bloc();
        expect(bloc.state.runtimeType, StateLoading);
    });

    test('use loadData method,Calls the data layer to load data', (){
        var bloc =SelfPage2Bloc();
        globalRepository = MockRepository();

        bloc.loadData();

        var path = '/user_info';
        verify(globalRepository.getData(path));

    });

    test('use loadData method,Returns the correct data,bloc outputs the status of the data ,data is saved to the member variable user', () async{
      var bloc =SelfPage2Bloc();
      globalRepository = MockRepository();

      var path = '/user_info';
      when(globalRepository.getData(path)).thenAnswer((realInvocation) async => jsonDecode(userJsonStr));


      bloc.loadData();

       var newState =await bloc.stream.first;

       expect(newState.runtimeType, StateData);
       expect(bloc.user.username, 'six');
       expect(bloc.user.nickname, "luke");
       expect(bloc.user.userId, "123456789");

    });

    test('use loadData method,network error,bloc outputs error status', ()async{
      var bloc =SelfPage2Bloc();
      globalRepository = MockRepository();

      var path = '/user_info';
      var errorMsg='network timeout';
      when(globalRepository.getData(path)).thenAnswer((realInvocation)async=>throw errorMsg);

      bloc.loadData();

      dynamic newState =await bloc.stream.first;
      expect(newState.runtimeType, StateError);
      expect(newState.msg, errorMsg);

    });
  });

  group('When the loading data is finished, the UI update is finished',(){
    testWidgets('load data error ,show the wrong page', (widgetTester) async{
      var page =SelfPage2();
      var testBloc =TestSelfPage2Bloc();
      page.setTestBloc(testBloc);

      await widgetTester.pumpWidget(TestApp(page));
      await widgetTester.pump();

      var errorWidgetFinder = find.byType(ErrorWidget);
      expect(errorWidgetFinder, findsOneWidget);

    });
  });


  group('When the loading data is finished,show the user info',(){
    testWidgets('the username is the same as the data', (widgetTester) async{
      var page =SelfPage2();
      var testBloc =TestSelfPage2Bloc3();
      page.setTestBloc(testBloc);

      await widgetTester.pumpWidget(TestApp(page));
      await widgetTester.pump();

      var contentFinder = find.text(testBloc.user.username??'');
      expect(contentFinder, findsOneWidget);

    });


    testWidgets('Account balance,Number of books purchased', (widgetTester)async{
      var page =SelfPage2();
      var testBloc =TestSelfPage2Bloc3();
      page.setTestBloc(testBloc);

      await widgetTester.pumpWidget(TestApp(page));
      await widgetTester.pump();

      var contentFinder = find.text(testBloc.user.balance.toString());
      expect(contentFinder, findsOneWidget);
      var bookCountFinder = find.text('already purchased ${testBloc.user.purchasedBooksCount} books');
      expect(bookCountFinder, findsOneWidget);

    });

    testWidgets('Unlimited cards,x dollars per month', (widgetTester)async{
      var page =SelfPage2();
      var testBloc =TestSelfPage2Bloc3();
      page.setTestBloc(testBloc);

      await widgetTester.pumpWidget(TestApp(page));
      await widgetTester.pump();

      var contentFinder = find.text('${testBloc.user.pricePerMonth}');
      expect(contentFinder, findsOneWidget);
      // var textFinder = find.text('/dollars per month');
      // expect(textFinder, findsOneWidget);
    });


    testWidgets('Reading charts,the reading time is 0 and it is displayed as not starting reading', (widgetTester)async{
      var page =SelfPage2();
      var testBloc =TestSelfPage2Bloc3();
      page.setTestBloc(testBloc);

      await widgetTester.pumpWidget(TestApp(page));
      await widgetTester.pump();

      testBloc.user.readingTime = 0;
      var contentFinder = find.text("I didn't start reading this week");
      expect(contentFinder, findsOneWidget);
    });


    testWidgets('Reading charts,the reading time is over 0 and it is displayed rank', (widgetTester)async{
      var page =SelfPage2();
      var testBloc =TestSelfPage2Bloc2();
      page.setTestBloc(testBloc);

      await widgetTester.pumpWidget(TestApp(page));
      await widgetTester.pump();


      var contentFinder = find.text("${testBloc.user.ranking}");
      expect(contentFinder, findsOneWidget);

    });


    testWidgets('follow', (widgetTester)async{
      var page =SelfPage2();
      var testBloc =TestSelfPage2Bloc2();
      page.setTestBloc(testBloc);

      await widgetTester.pumpWidget(TestApp(page));
      await widgetTester.pump();


      var contentFinder = find.text(testBloc.user.followersCount.toString());
      expect(contentFinder, findsOneWidget);

      var readingFriendFinder = find.text("${testBloc.user.readingCount}");
      expect(contentFinder, findsOneWidget);

    });



  });


}


class TestSelfPage2Bloc extends SelfPage2Bloc{
  @override
  void loadData(){
    emitState(StateError('network error'));
  }
}

class TestSelfPage2Bloc2 extends SelfPage2Bloc{
  @override
  void loadData(){
    user = User.fromJson(jsonDecode(userJsonStr));
    emitState(StateData());
  }
}

class TestSelfPage2Bloc3 extends SelfPage2Bloc{
  @override
  void loadData(){
    user = User.fromJson(jsonDecode(userJsonStrReadingTime0));

    emitState(StateData());
  }


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

var userJsonStrReadingTime0 = '''{
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
  "readingTime":0,
  "notesCount":20,
  "booksReadCount":30,
  "likesCOunt":50,
  "booklistsCount":5,
  "ranking":0
}''';
