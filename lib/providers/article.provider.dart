import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.model.dart';

class ArticleProvider {
  Future<List<ArticleModel>> getArticles() async {
    List<ArticleModel> articles = [];

    var client = http.Client();
    try {
      Map<String, String> queryParameters = {
        'q': 'tesla',
        'from': '2022-08-17',
        'sortBy': 'publishedAt',
        'apiKey': '3dde6858a31a4faab81a10ef61f2ad4a',
      };

      var response = await client.get(Uri.https('newsapi.org', '/v2/everything', queryParameters));

      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      decodedResponse['articles'].forEach((item) => articles.add(ArticleModel.fromJson(item)));
      return articles;
    } finally {
      client.close();
    }
  }
}
