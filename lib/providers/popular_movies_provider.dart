import 'package:cinemate/repositories/popular_movies_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularMoviesRepoProvider = Provider<PopularMoviesRepo>((ref) {
  return HttpPopularMoviesRepo();
});

final popularMoviesProvider = FutureProvider.autoDispose((ref) async {
  final popularMoviesRepo = ref.watch(popularMoviesRepoProvider);
  return popularMoviesRepo.getPopularMovies(2);
});
