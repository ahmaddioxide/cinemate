import 'package:flutter/material.dart';
import 'package:cinemate/services/client/base_client.dart';
import 'package:cinemate/models/trending_movies_response_model.dart';


abstract class TrendingMoviesRepo {
  Future<TrendingMoviesResponse> getTrendingMoviesResponse([int page = 1]);
}

class HttpTrendingMoviesRepo implements TrendingMoviesRepo {
  @override
  Future<TrendingMoviesResponse> getTrendingMoviesResponse([int page = 1]) async {
    TrendingMoviesResponse trendingMoviesResponse;
    final String uri = '/trending/movie/day?language=en-US&page=${page.toString()}';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    debugPrint(response.toString());
    trendingMoviesResponse = TrendingMoviesResponse.fromJson(response);
    return trendingMoviesResponse;
  }
}
