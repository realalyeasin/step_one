import 'dart:convert';

List<QuotesModel> quotesModelFromJson(String str) => List<QuotesModel>.from(json.decode(str).map((x) => QuotesModel.fromJson(x)));

String quotesModelToJson(List<QuotesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotesModel {
  QuotesModel({
    required this.quote,
    required this.author,
    required this.category,
  });

  String quote;
  String author;
  Category? category;

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
    quote: json["quote"],
    author: json["author"],
    category: categoryValues.map[json["category"]],
  );

  Map<String, dynamic> toJson() => {
    "quote": quote,
    "author": author,
    "category": categoryValues.reverse[category],
  };
}

enum Category { MORNING }

final categoryValues = EnumValues({
  "morning": Category.MORNING
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
