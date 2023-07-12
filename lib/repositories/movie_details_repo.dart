import 'package:flutter/material.dart';
import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/services/client/base_client.dart';

abstract class MovieDetailsRepo {
  Future<Movie> getMovieDetails(int id);
}

class HttpMovieDetails implements MovieDetailsRepo {
  @override
  Future<Movie> getMovieDetails(int id) async {
    Movie movie;
    final String uri = '/movie/${id.toString()}?language=en-US';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    debugPrint(response.toString());
    movie = Movie.fromJson(response);
    return movie;
  }
}
