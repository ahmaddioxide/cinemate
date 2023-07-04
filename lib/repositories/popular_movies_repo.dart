import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/models/popular_movies_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';
import 'package:flutter/material.dart';

abstract class PopularMoviesRepo {
  Future<List<Movie>> getPopularMovies([int page = 1]);
  Future<int> getTotalPages();
}

class HttpPopularMoviesRepo implements PopularMoviesRepo {
  late final PopularMoviesResponse _popularMoviesResponse;

  @override
  Future<List<Movie>> getPopularMovies([int page = 1]) async {
    final String uri = '/movie/popular?language=en-US&page=${page.toString()}';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    debugPrint(response.toString());
    _popularMoviesResponse = PopularMoviesResponse.fromJson(response);
    return _popularMoviesResponse.results;
  }

  @override
  Future<int> getTotalPages() async {
    // ignore: unnecessary_null_comparison
    if (_popularMoviesResponse.totalPages == null) {
      debugPrint(
        'Total Pages is null, calling getPopularMovies() to get total pages${_popularMoviesResponse.totalPages}',
      );
      await getPopularMovies(1).then((value) {
        return _popularMoviesResponse.totalPages;
      });
    }
    debugPrint(
      'Total Pages is not null, returning total pages${_popularMoviesResponse.totalPages}',
    );
    return _popularMoviesResponse.totalPages;
  }
}
