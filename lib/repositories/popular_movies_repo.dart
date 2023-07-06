import 'package:cinemate/models/popular_movies_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';
import 'package:flutter/material.dart';

abstract class PopularMoviesRepo {
  Future<PopularMoviesResponse> getPopularMoviesResponse([int page = 1]);
}

class HttpPopularMoviesRepo implements PopularMoviesRepo {
  @override
  Future<PopularMoviesResponse> getPopularMoviesResponse([int page = 1]) async {
    PopularMoviesResponse popularMoviesResponse;
    final String uri = '/movie/popular?language=en-US&page=${page.toString()}';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    debugPrint(response.toString());
    popularMoviesResponse = PopularMoviesResponse.fromJson(response);
    return popularMoviesResponse;
  }
}
