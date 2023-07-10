import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNumberNotifier extends StateNotifier<int> {
  PageNumberNotifier() : super(1);

  void setPageNumber(int pageNumber) {
    state = pageNumber;
  }
}

final nowPlayingMoviesPageNumberProvider =
    StateNotifierProvider<PageNumberNotifier, int>(
  (ref) => PageNumberNotifier(),
);
final trendingMoviesPageNumberProvider =
    StateNotifierProvider<PageNumberNotifier, int>(
  (ref) => PageNumberNotifier(),
);
final topRatedMoviesNumberProvider =
    StateNotifierProvider<PageNumberNotifier, int>(
  (ref) => PageNumberNotifier(),
);

final popularMoviesWithGenresPageNumberProvider =
    StateNotifierProvider<PageNumberNotifier, int>(
  (ref) => PageNumberNotifier(),
);
