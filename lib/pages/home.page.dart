// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:newnoticias/widgets/card.widget.dart';
import '../models/article.model.dart';
import '../providers/article.provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final articleProvider = ArticleProvider();
  late Future<List<ArticleModel>> articles;

  @override
  void initState() {
    articles = articleProvider.getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home - Noticias"),
      ),
      body: FutureBuilder(
          future: articles,
          builder: ((context, snapshot) {
            List<Widget> lista = [];
            if (snapshot.hasData) {
              snapshot.data
                  ?.forEach((element) => lista.add(CardWidget(article: element)));
              return ListView(
                children: lista,
              );
            } else {
              return CircularProgressIndicator();
            }
          })),
    );
  }
}
