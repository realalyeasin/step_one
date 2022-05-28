import 'package:flutter/cupertino.dart';
import 'package:step_one/Model/quotes_model.dart';

@immutable
abstract class DataState{}

class DataInitialState extends DataState{}

class DataLoadingState extends DataState{}

class DataLoadedState extends DataState{
  final List<QuotesModel> api;
  DataLoadedState({required this.api});
}
class DataErrorState extends DataState{}

