import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:wx_reader_book/bloc/base_bloc.dart';
import 'package:wx_reader_book/bloc/self_page_bloc.dart';
import 'package:wx_reader_book/data_repository/repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'SelfPageBloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Repository>()])
void main() {
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


   test('selfPageBloc status StateLoading', () {
    var bloc= SelfPageBloc();
    expect(bloc.state.runtimeType,equals(StateLoading));
  });

  test('selfPageBloc loadData success StateData', ()async {
    var bloc= SelfPageBloc();

    var mockRepository = MockRepository();
    globalRepository = mockRepository;

    var path = '/user_info';
    when(mockRepository.getData(path)).thenAnswer((_) async => jsonDecode(userJsonStr));

    bloc.loadData();
    var state = await bloc.stream.first;
    
    expect(state.runtimeType, equals(StateData));
    expect(bloc.user.username, equals('six'));
    expect(bloc.user.likesCOunt, equals(50));
  });



  test('selfPageBloc loadData error   StateError', ()async {
    var bloc= SelfPageBloc();

    var mockRepository = MockRepository();
    globalRepository = mockRepository;

    var path = '/user_info';
    when(mockRepository.getData(path)).thenThrow(Exception('network error'));

    bloc.loadData();
    var state = await bloc.stream.first;

    expect(state.runtimeType, equals(StateError));

  });

}