import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_one/Bloc/data_event.dart';
import 'package:step_one/Bloc/data_state.dart';
import 'package:step_one/Model/quotes_model.dart';
import '../Repositories/repo.dart';

class DataBloc extends Bloc<DataEvent,DataState>{
  final Repo repo;
  DataBloc(this.repo) : super(DataInitialState()){
   on<DataEvent>((event, emit) async {
         if(event is LoadDataEvent){
           emit(DataLoadingState());
           List<QuotesModel>? api = await repo.getQuotes();
           print(api);
           if(api == null){
             emit(DataErrorState());
           } else {
             emit(DataLoadedState(api: api));
           }
         }
   });
  }
}