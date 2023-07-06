
import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/models/similar_movies_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';

abstract class SimilarMoviesRepo {
  Future<List<Movie>> getSimilarMovies(int movieId);
}

class HttpSimilarMoviesRepo implements SimilarMoviesRepo {
  @override
  Future<List<Movie>> getSimilarMovies(int movieId) async {
    final String uri = '/movie/$movieId/similar?language=en-US&page=1';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    final SimilarMoviesResponse similarMoviesResponse =
        SimilarMoviesResponse.fromJson(response);
    return similarMoviesResponse.results;
  }
}