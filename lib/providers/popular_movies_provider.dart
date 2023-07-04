import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/repositories/popular_movies_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularMoviesRepoProvider = Provider<PopularMoviesRepo>((ref) {
  return HttpPopularMoviesRepo();
});

final popularMoviesProvider = FutureProvider.autoDispose.family<List<Movie>,int> ((ref,start) async {
  final popularMoviesRepo = ref.watch(popularMoviesRepoProvider);
  return popularMoviesRepo.getPopularMovies(start);
});
