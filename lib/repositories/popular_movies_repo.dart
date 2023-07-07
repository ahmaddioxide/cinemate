import 'package:cinemate/models/top_rated_movies_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';
import 'package:flutter/material.dart';

abstract class TopRatedMoviesRepo {
  Future<TopRatedMoviesResponse> getPopularMoviesResponse([int page = 1]);
}

class HttpTopRatedMoviesRepo implements TopRatedMoviesRepo {
  @override
  Future<TopRatedMoviesResponse> getPopularMoviesResponse([int page = 1]) async {
    TopRatedMoviesResponse popularMoviesResponse;
    final String uri = '/movie/top_rated?language=en-US&page=${page.toString()}';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    debugPrint(response.toString());
    popularMoviesResponse = TopRatedMoviesResponse.fromJson(response);
    return popularMoviesResponse;
  }
}
