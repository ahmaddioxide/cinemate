import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:cinemate/views/screens/popular_movies_with_genres/popular_movies_with_genres_screen.dart';


final Map<String, int> movieGenres = {
  'Action': 28,
  'Adventure': 12,
  'Animation': 16,
  'Comedy': 35,
  'Crime': 80,
  'Documentary': 99,
  'Drama': 18,
  'Family': 10751,
  'Fantasy': 14,
  'History': 36,
  'Horror': 27,
  'Music': 10402,
  'Mystery': 9648,
  'Romance': 10749,
  'Science Fiction': 878,
  'TV Movie': 10770,
  'Thriller': 53,
  'War': 10752,
  'Western': 37,
};

final selectedGenresProvider =
    StateNotifierProvider<SelectedGenresNotifier, List<int>>(
  (ref) => SelectedGenresNotifier(),
);

class GenreSelectionScreen extends ConsumerWidget {
  const GenreSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGenres = ref.watch(selectedGenresProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Genre Selection'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: movieGenres.length,
        itemBuilder: (context, index) {
          final genreName = movieGenres.keys.elementAt(index);
          final genreCode = movieGenres.values.elementAt(index);
          final isSelected = selectedGenres.contains(genreCode);

          return Card(
            color: isSelected ? darkAccent : null,
            child: InkWell(
              onTap: () {
                ref
                    .read(selectedGenresProvider.notifier)
                    .toggleGenre(genreCode);
              },
              child: Center(
                child: Text(
                  genreName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : null,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          debugPrint(selectedGenres.toString());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PopularMoviesWithGenresScreen(
                genreIds: selectedGenres,
              ),
            ),
          );
        },
        label: const Text(
          'Continue',
          style: TextStyle(color: darkAccent),
        ),
        icon: const Icon(Icons.arrow_forward, color: darkAccent),
      ),
    );
  }
}

class SelectedGenresNotifier extends StateNotifier<List<int>> {
  SelectedGenresNotifier() : super([]);

  void toggleGenre(int genreCode) {
    if (state.contains(genreCode)) {
      state = state.where((g) => g != genreCode).toList();
    } else {
      state = [...state, genreCode];
    }
  }
}
