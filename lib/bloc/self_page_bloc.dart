import 'package:wx_reader_book/bloc/base_bloc.dart';


class SelfPageBloc extends BaseBloc<BaseBlocState>{
  SelfPageBloc():super(StateLoading());

}

class BaseBlocState{}

class StateLoading extends BaseBlocState{}

class StateData extends BaseBlocState{}

class StateError extends BaseBlocState{}