import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wx_reader_book/bloc/self_page_bloc.dart';
import 'package:wx_reader_book/pages/base_page.dart';
import 'package:wx_reader_book/widgets/loading_widget.dart';

class SelfPage extends BasePage<SelfPageBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<SelfPageBloc, BaseBlocState>(builder: (context, state) {
      if (state is StateLoading) {
        return const LoadingWidget();
      }

      return Text('empty');
    });
  }

  @override
  SelfPageBloc createBloc(BuildContext context) {
    return SelfPageBloc();
  }
}

