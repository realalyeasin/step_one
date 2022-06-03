import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.meta,
    required this.data,
  });

  Meta meta;
  List<Datum> data;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    meta: Meta.fromJson(json["meta"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meta": meta.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.uuid,
    required this.title,
    required this.description,
    required this.keywords,
    required this.snippet,
    required this.url,
    required this.imageUrl,
    required this.language,
    required this.publishedAt,
    required this.source,
    required this.categories,
    this.relevanceScore,
  });

  String? uuid;
  String? title;
  String? description;
  String? keywords;
  String? snippet;
  String? url;
  String? imageUrl;
  String? language;
  DateTime? publishedAt;
  String? source;
  List<String> categories;
  dynamic relevanceScore;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uuid: json["uuid"] ?? '',
    title: json["title"] ?? '',
    description: json["description"] ?? '',
    keywords: json["keywords"] ?? '',
    snippet: json["snippet"] ?? '',
    url: json["url"] ?? '',
    imageUrl: json["image_url"] ?? '',
    language: json["language"] ?? '',
    publishedAt: DateTime.parse(json["published_at"]),
    source: json["source"] ?? '',
    categories: List<String>.from(json["categories"].map((x) => x)),
    relevanceScore: json["relevance_score"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid ?? '',
    "title": title ?? '',
    "description": description ?? '',
    "keywords": keywords ?? '',
    "snippet": snippet ?? '',
    "url": url ?? '',
    "image_url": imageUrl ?? '',
    "language": language ?? '',
    "published_at": publishedAt?.toIso8601String() ?? '',
    "source": source ?? '',
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "relevance_score": relevanceScore,
  };
}

class Meta {
  Meta({
    required this.found,
    required this.returned,
    required this.limit,
    required this.page,
  });

  int? found;
  int? returned;
  int? limit;
  int? page;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    found: json["found"] ?? '',
    returned: json["returned"] ?? '',
    limit: json["limit"] ?? '',
    page: json["page"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "found": found,
    "returned": returned,
    "limit": limit,
    "page": page,
  };
}
