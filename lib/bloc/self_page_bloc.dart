import 'package:wx_reader_book/bean/User.dart';
import 'package:wx_reader_book/bloc/base_bloc.dart';
import 'package:wx_reader_book/data_repository/repository.dart';


class SelfPageBloc extends BaseBloc<BaseBlocState>{
  late User user ;

  SelfPageBloc():super(StateLoading());

  Future<void> loadData() async {
     var path = '/user_info';
    var  userData= await globalRepository.getData(path);
    user =User.fromJson(userData);

    emitState(StateData());
  }

}

class BaseBlocState{}

class StateLoading extends BaseBlocState{}

class StateData extends BaseBlocState{}

class StateError extends BaseBlocState{}