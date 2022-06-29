import 'package:news_app/data/model/article.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  //pakai api key yang sudah didaftarkan
  // static final String _apiKey = 'https://newsapi.org/v2/';
  static const String _apiKey = '6b2e23af33fb4d81b56cc61c98340b9e';
  static const String _category = 'business';
  static const String _country = 'id';

  Future<ArticleResult> topHeadlines() async {
    final response = await http.get(Uri.parse("${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if (response.statusCode == 200) {
      return ArticleResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load headlines');
    }
  }
}
