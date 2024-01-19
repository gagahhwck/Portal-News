// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

class Welcome {
  final String status;
  final int totalResults;
  final List<Article> articles;

  Welcome({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //     "status": status,
  //     "totalResults": totalResults,
  //     "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  // };
}

class Article {
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(
          json["source"] ?? {"id": "no id", "name": "no name"},
        ),
        author: json["author"] ?? "No author",
        title: json["title"] ?? "No Title",
        description: json["description"] ?? "No Description",
        url: json["url"] ?? "www.uiii.ac.id",
        urlToImage: json["urlToImage"] ??
            "https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg",
        publishedAt:
            DateTime.parse(json["publishedAt"] ?? "2024-01-15T20:17:06Z"),
        content: json["content"] ?? "No Content",
      );
}

class Source {
  final String? id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );
}
