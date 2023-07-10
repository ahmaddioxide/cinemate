import 'package:cinemate/models/movies_with_genres_response_model.dart';
import 'package:cinemate/providers/page_number_providers.dart';
import 'package:cinemate/repositories/movies_with_genres_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final popularMoviesWithGenreRepoProvider =
    Provider<PopularMoviesWithGenresRepo>(
  (ref) {
    return HttpPopularMoviesWithGenre();
  },
);

final popularMoviesWithGenresProvider = FutureProvider.autoDispose
    .family<PopularMoviesWithGenresResponse, List<int>>(
  (ref, listOfGenres) async {
    final popularMoviesWithGenresRepo =
        ref.watch(popularMoviesWithGenreRepoProvider);
    final pageNumber = ref.watch(popularMoviesWithGenresPageNumberProvider);
    return popularMoviesWithGenresRepo.getPopularMoviesWithGenres(
      listOfGenres,
      pageNumber,
    );
  },
);
