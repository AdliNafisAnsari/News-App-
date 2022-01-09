import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_19710033/model/article_model.dart';

class ApiService {
  final endPointUrl = "newsapi.org";
  final client = http.Client();

  Future<List<Article>> getArticle() async {
    final queryParameters = {
    'country': 'id',
    'category': 'technology',
    'apiKey': '92e5d8bb0e674175a622e5433406f366'
};

  final uri = Uri.https(endPointUrl, '/v2/top-headlines', queryParameters);
  final response = await client.get(uri);
  Map<String, dynamic> json = jsonDecode(response.body);
  List<dynamic> body = json['articles'];
  List<Article> articles =
    body.map((dynamic item) => Article.fromJson(item)).toList();
  return articles;
  }
}