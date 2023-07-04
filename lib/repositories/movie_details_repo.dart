import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/models/popular_movies_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';
import 'package:flutter/material.dart';

abstract class MovieDetails {
  Future<Movie>  getMovieDetails(int id);
}

class HttpMovieDetails implements MovieDetails {

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
