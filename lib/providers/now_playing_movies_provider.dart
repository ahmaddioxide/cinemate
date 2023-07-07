
import 'package:cinemate/models/now_playing_movies_response_model.dart';
import 'package:cinemate/repositories/now_playing_movies_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularMoviesRepoProvider = Provider<NowPlayingMoviesRepo>((ref) {
  return HttpNowPlayingMoviesRepo();
});

final nowPlayingMoviesProvider = FutureProvider.autoDispose
    .family<NowPlayingMoviesResponse, int>((ref, start) async {
  final nowPlayingMoviesRepo = ref.watch(popularMoviesRepoProvider);
  return nowPlayingMoviesRepo.getNowPlayingMoviesResponse(start);
});