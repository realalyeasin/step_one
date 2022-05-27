import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_one/Bloc/data_event.dart';
import 'package:step_one/Bloc/data_state.dart';

class DataBloc extends Bloc<DataEvent,DataState>{
  DataBloc() : super(DataInitialState()){
   on<DataEvent>((event, emit) async {
         emit(DataLoadedState());
   });
  }
}