import 'package:cinemate/models/movies_with_genres_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';
import 'package:flutter/material.dart';

abstract class PopularMoviesWithGenresRepo {
  Future<PopularMoviesWithGenresResponse> getPopularMoviesWithGenres(
      List<int> genreIds, int pageNumber,);
}

class HttpPopularMoviesWithGenre implements PopularMoviesWithGenresRepo {
  @override
  Future<PopularMoviesWithGenresResponse> getPopularMoviesWithGenres(
      List<int> genreIds, int pageNumber,) async {
    String genreIdsString = '';
    for (int i = 0; i < genreIds.length; i++) {
      genreIdsString += genreIds[i].toString();
      if (i != genreIds.length - 1) {
        genreIdsString += '|';
      }
    }

    String uri =
        '/discover/movie?include_adult=false&include_video=false&language=en-US&page=$pageNumber&sort_by=popularity.desc&with_genres=$genreIdsString';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    debugPrint(response.toString());
    PopularMoviesWithGenresResponse popularMoviesWithGenresResponse =
        PopularMoviesWithGenresResponse.fromJson(response);
    return popularMoviesWithGenresResponse;
  }
}
