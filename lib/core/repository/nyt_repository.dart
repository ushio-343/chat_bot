import 'package:botreal/core/models/nyt_response.dart';
import 'package:botreal/core/services/api_service_dio.dart';
import 'package:botreal/core/services/api_service_http.dart';

class NYTRepository {
  final ApiService _nytApiService = ApiService();

  Future<NYTResponse> getNews() async {
    final data = await _nytApiService.getNews();
    return NYTResponse.fromJson(data);
  }
}

class NYTRepositoryHttp {
  final ApiServiceHttp _nytApiService = ApiServiceHttp();

  Future<NYTResponse> getNews() async {
    final data = await _nytApiService.getNews();
    return NYTResponse.fromJson(data);
  }
}

