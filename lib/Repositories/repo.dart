import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../Model/quotes_model.dart';
import 'package:http/http.dart' as http;

class Repo{
  Future<List<QuotesModel>?> getQuotes() async {
    String category= 'mom';
    int limit = 5;
    String baseUrl = 'https://api.api-ninjas.com/v1/quotes?category=$category&limit=$limit';
    var headers = {
      'X-Api-Key' : '${dotenv.get('API_KEY')}',
  };
    final response = await http.Client().get(Uri.parse(baseUrl),headers: headers);
    print(response.body);
    if(response.statusCode == 200){
      Iterable results = jsonDecode(response.body);
      List<QuotesModel> quoteModels = [];
      for(var result in results){
        QuotesModel quotesModel = QuotesModel.fromJson(result);
        quoteModels.add(quotesModel);
      } print(quoteModels);
      return quoteModels;
    } else if(response.statusCode != 200){
      return null;
    }
  }
}