import 'package:dio/dio.dart';

class Apiservice {
  static const String baseUrl = 'https://newsapi.org/v2/';
  static const String apiKey = '78925b453f294f19a14a44ffc3e6bbf0';

  Future<Response> getTopHeadlines() async {
    return await Dio().get(
      '${baseUrl}top-headlines?category=technology&apiKey=$apiKey',
    );
  }

  Future<Response> getnewestNews() async {
    return await Dio().get(
      '${baseUrl}everything?q=new&sortBy=publishedAt&apiKey=$apiKey',
    );
  }

  Future<Response> searchNews(String query) async {
    return await Dio().get('${baseUrl}everything?q=$query&apiKey=$apiKey');
  }
}
