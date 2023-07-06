import 'package:cinemate/models/movie_credits_response_model.dart';
import 'package:cinemate/repositories/movie_credits_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieCreditsRepoProvider = Provider<MovieCreditsRepo>((ref) {
  return HttpMovieCredits();
});

final movieCreditsProvider = FutureProvider.autoDispose
    .family<MovieCreditsResponse, int>((ref, id) async {
  final movieCreditsRepo = ref.watch(movieCreditsRepoProvider);
  return movieCreditsRepo.getMovieCredits(id);
});
