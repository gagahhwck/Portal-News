import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_ui/model/response_article.dart';

class NetClient {
  static Future<List<Article>> fetchArticles() async {
  final response = await http
      .get(Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2024-01-15&to=2024-01-15&sortBy=popularity&apiKey=ffb1fe3bcb6244a3a6e8f71ff809d54c'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final responseBody = jsonDecode(response.body);
    final responseArticles = Welcome.fromJson(responseBody);
    final listArticle = responseArticles.articles;
    return listArticle;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load articles');
  }
}
}