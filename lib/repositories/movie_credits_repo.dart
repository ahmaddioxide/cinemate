import 'package:cinemate/models/movie_credits_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';

abstract class MovieCreditsRepo {
  Future<MovieCreditsResponse> getMovieCredits(int movieId);
}

class HttpMovieCredits implements MovieCreditsRepo {
  @override
  Future<MovieCreditsResponse> getMovieCredits(int movieId) async {
    MovieCreditsResponse movieCreditsResponse;
    final String uri = '/movie/${movieId.toString()}/credits?language=en-US';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    movieCreditsResponse = MovieCreditsResponse.fromJson(response);
    return movieCreditsResponse;
  }
}
