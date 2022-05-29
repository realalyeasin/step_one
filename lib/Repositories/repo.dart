import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:step_one/Model/nutrition_model.dart';
import '../Model/quotes_model.dart';
import 'package:http/http.dart' as http;

class Repo extends GetxController {
  var quoteModels = [].obs;
  var nutritionModels = [].obs;

  Future<RxList?> getQuotes(String cat) async {
    print(cat);
    int limit = 10;
    var headers = {
      'X-Api-Key': '${dotenv.get('API_KEY')}',
    };
    String baseUrl =
        'https://api.api-ninjas.com/v1/quotes?category=$cat&limit=$limit';
    final response =
        await http.Client().get(Uri.parse(baseUrl), headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      Iterable results = jsonDecode(response.body);
      for (var result in results) {
        var quotesModel = QuotesModel.fromJson(result);
        quoteModels.add(quotesModel);
      }
      print(quoteModels);
      update();
      return quoteModels;
    } else if (response.statusCode != 200) {
      return null;
    }
  }

  Future<RxList?> getNutrition(String nut) async {
    print(nut);
    var headers = {
      'X-Api-Key': '${dotenv.get('API_KEY')}',
    };
    String baseUrl = 'https://api.api-ninjas.com/v1/nutrition?query=$nut';
    final response =
        await http.Client().get(Uri.parse(baseUrl), headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      Iterable results = jsonDecode(response.body);
      for (var result in results) {
        var nutritionModel = NutritionModel.fromJson(result);
        nutritionModels.add(nutritionModel);
      }
      print(nutritionModels);
      update();
      return nutritionModels;
    } else if (response.statusCode != 200) {
      return null;
    }
  }

  RxList get repoApi => quoteModels;
  RxList get repoNutApi => nutritionModels;
}
