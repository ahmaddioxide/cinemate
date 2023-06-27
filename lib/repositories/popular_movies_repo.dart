
import 'dart:convert';

import 'package:cinemate/api/tmdb_api.dart';
import 'package:cinemate/client/base_client.dart';
import 'package:cinemate/models/popular_movies_response_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

abstract class PopularMoviesRepo {
  Future<List<dynamic>> getPopularMovies(int page);
}

class HttpPopularMoviesRepo implements PopularMoviesRepo
{
  late final PopularMoviesResponse _popularMoviesResponse;
  @override
  Future<List<dynamic>> getPopularMovies(int page) async {

    final uri='/movie/popular?language=en-US&page=${page.toString()}';
    final response= await BaseClient().get(uri);
    print(response);

    _popularMoviesResponse= PopularMoviesResponse.fromJson(response);

    return _popularMoviesResponse.results;
  }
}