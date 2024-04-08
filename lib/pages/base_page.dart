import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wx_reader_book/bloc/base_bloc.dart';

abstract class BasePage<B extends BaseBloc> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(create: createBloc, child: buildPage(context));
  }

  B createBloc(BuildContext context);

  Widget buildPage(BuildContext context);
}
