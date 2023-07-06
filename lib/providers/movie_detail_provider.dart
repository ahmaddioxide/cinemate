import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/repositories/movie_details_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailsRepoProvider = Provider<MovieDetailsRepo>((ref) {
  return HttpMovieDetails();
});

final movieDetailsProvider =
   FutureProvider.autoDispose.family<Movie, int>((ref, id) async {
  final movieDetailRepo = ref.watch(movieDetailsRepoProvider);
  return movieDetailRepo.getMovieDetails(id);
});
