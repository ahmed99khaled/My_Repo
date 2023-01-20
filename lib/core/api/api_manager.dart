import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/model/NewsResponse.dart';
import 'package:news_app/core/model/SourcesResponse.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = '6e247aaf160e40fb897b0d2ebc540c0b';

  static Future<SourcesResponse> getSources(String categoryId) async {
    var url = Uri.https(baseUrl, '/v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': categoryId});
    var response = await http.get(url);
    return SourcesResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> getNews({String? sourceId, String? query}) async {
    var url = Uri.https(baseUrl, '/v2/everything',
        {'apiKey': apiKey, 'sources': sourceId, 'q': query});
    var response = await http.get(url);
    return NewsResponse.fromJson(jsonDecode(response.body));
  }
//newsapi.org
// /v2/everything?
// apiKey=6e247aaf160e40fb897b0d2ebc540c0b
// &sources=bbc-sport
//---------------------------------
// https://newsapi.org
// /v2/top-headlines/sources?
//  apiKey=6e247aaf160e40fb897b0d2ebc540c0b&=

}
