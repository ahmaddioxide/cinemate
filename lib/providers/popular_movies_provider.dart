import 'package:cinemate/models/top_rated_movies_response_model.dart';
import 'package:cinemate/repositories/popular_movies_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final topRatedMoviesRepoProvider = Provider<TopRatedMoviesRepo>((ref) {
  return HttpTopRatedMoviesRepo();
});

final topRatedMoviesProvider = FutureProvider.autoDispose
    .family<TopRatedMoviesResponse, int>((ref, start) async {
  final topRatedMoviesRepo = ref.watch(topRatedMoviesRepoProvider);
  return topRatedMoviesRepo.getPopularMoviesResponse(start);
});
