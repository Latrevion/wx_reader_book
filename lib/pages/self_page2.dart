//use TDD develop this dart file

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wx_reader_book/bean/User.dart';
import 'package:wx_reader_book/bloc/base_bloc.dart';
import 'package:wx_reader_book/bloc/self_page_bloc.dart';
import 'package:wx_reader_book/data_repository/repository.dart';
import 'package:wx_reader_book/pages/base_page.dart';
import 'package:wx_reader_book/widgets/loading_widget.dart';

class SelfPage2 extends BasePage<SelfPage2Bloc>{
    SelfPage2({super.key});

  @override
  Widget buildPage(BuildContext context) {
    var bloc = context.read<SelfPage2Bloc>();
    bloc.loadData();
    return const LoadingWidget();
  }

  @override
  SelfPage2Bloc createBloc(BuildContext context) {
    return SelfPage2Bloc();
  }

}

class SelfPage2Bloc extends BaseBloc<BaseBlocState>{
  late User user;

  SelfPage2Bloc():super(StateLoading());

  void loadData() async {
    var path = '/user_info';

    try {
      var jsonData =await globalRepository.getData(path);
      user = User.fromJson(jsonData);
      emitState(StateData());
    } catch (e) {
        emitState(StateError(e.toString()));
    }

  }
}