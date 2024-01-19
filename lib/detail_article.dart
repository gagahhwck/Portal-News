import 'package:flutter/material.dart';
import 'package:news_ui/model/response_article.dart';

class DetailArticle extends StatelessWidget {
  final Article article;
  const DetailArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: const Text("Detail Berita"),
      ),
      body: Column(
        children: [
          Image.network(article.urlToImage),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            Text(article.content, textAlign: TextAlign.justify, style: TextStyle(fontSize: 20),)
          ),
        ],
      ),
    );
  }
}
