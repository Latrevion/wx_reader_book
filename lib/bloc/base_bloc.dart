import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<State> extends Cubit<State>{
  BaseBloc(State initialState):super(initialState);

  //Notify the UI layer of the latest status changes
void emitState(State state){
  emit(state);
}

@override
  void onChange(Change<State> change){
  super.onChange(change);
  //Handle operations such as logs and statistics
}

}