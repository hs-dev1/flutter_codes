import 'package:dio/dio.dart';

import '../constants/api_urls.dart';

class NewsService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiUrls.baseUrl,
    responseType: ResponseType.json,
  ));

  Future<Map<String, dynamic>> fetchNews() async {
    var response = await _dio.get('api/1/news?apikey=${ApiUrls.apiKey}&q=headlines&country=us');

// /api/1/news?apikey=pub_26378146b145c409e45fe9dc1134254a7d7f0&q=url
    return response.data as Map<String, dynamic>;
  }

  Future<void> fetchNewsBySearching(String title) async {
    var response = await _dio.get('v2/everything?q=$title&apiKey=${ApiUrls.apiKey}');

    return response.data;
  }
}

// https://newsdata.io/api/1/news?apikey=pub_26378146b145c409e45fe9dc1134254a7d7f0&q=headlines&country=us
