import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wx_reader_book/bloc/base_bloc.dart';
import 'package:wx_reader_book/main.dart';

abstract class BasePage<B extends BaseBloc> extends StatelessWidget {
    // B? _testBloc;
  final List<B> _blocContainer = [];

   BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: _getBloc,
        child:Builder(builder: (c){
         return  buildPage(c);
        },),
    );
  }

  B createBloc(BuildContext context);

  Widget buildPage(BuildContext context);

  void setTestBloc(B testBloc){
    if(isRunningTests) {
      _blocContainer.add(testBloc);
    } else{
      throw Exception("setTestBloc must be called in test environment");
    }
  }

  B _getBloc(BuildContext context){
    var bloc =createBloc(context);

    if(isRunningTests && _blocContainer.isNotEmpty) {
      bloc=  _blocContainer.first;
    }
      return bloc;

  }

}
