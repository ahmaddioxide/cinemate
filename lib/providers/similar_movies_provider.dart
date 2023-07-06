import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/repositories/similar_movies_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final similarMoviesRepoProvider = Provider<SimilarMoviesRepo>((ref) {
  return HttpSimilarMoviesRepo();
});

final similarMoviesProvider =
    FutureProvider.autoDispose.family<List<Movie>, int>((ref, movieId) async {
  final similarMoviesRepo = ref.watch(similarMoviesRepoProvider);
  return similarMoviesRepo.getSimilarMovies(movieId);
});
