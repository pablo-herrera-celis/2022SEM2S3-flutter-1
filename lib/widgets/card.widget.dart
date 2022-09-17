import 'package:flutter/material.dart';
import 'package:newnoticias/models/article.model.dart';
import 'package:newnoticias/pages/detalle.page.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.article});

  ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: ((context) => DetallePage(article: article))));
        },
        child: Container(
          color: Colors.red,
          height: 100,
          child: Column(
            children: [
              Text(article.author),
              Text(article.content),
            ],
          ),
        ),
      ),
    );
  }
}
