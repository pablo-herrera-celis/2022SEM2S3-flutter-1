import 'package:flutter/material.dart';
import 'package:newnoticias/models/article.model.dart';

class DetallePage extends StatelessWidget {
  DetallePage({super.key, required this.article});
  ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Container(
        child: Text(article.title),
      ),
    );
  }
}
