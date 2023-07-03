import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/providers/popular_movies_provider.dart';
import 'package:cinemate/services/process_genre_code.dart';
import 'package:cinemate/services/process_image_link.dart';
import 'package:cinemate/views/components/movie_tile_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularMoviesAll extends ConsumerWidget {
  const PopularMoviesAll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Movie>> movies = ref.watch(popularMoviesProvider);
    final List<Movie> moviesList = movies.when(
      data: (List<Movie> value) => value,
      error: (Object e, _) => [],
      loading: () => [
        const Movie(
            adult: false,
            id: 00,
            originalTitle: 'Loading',
            originalLanguage: 'Loading',
            overview: '',
            popularity: 0,
            title: 'Loading',
            voteAverage: 0,
            voteCount: 0,
            releaseDate: 'Loading',
            genreIds: [0],
            posterPath: 'Loading...')
      ],
    );
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popular Movies',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          // vertical: height * 0.001,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.018,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    return MovieTileHorizontal(
                      movieName: moviesList[index].title,
                      moviePoster: ProcessImage.processImageLink(
                          moviesList[index].posterPath),
                      movieReleaseDate:
                          moviesList[index].releaseDate.toString(),
                      movieRating: moviesList[index].voteAverage.toString(),
                      movieGenres: ProcessGenreCode.processGenreCodes(
                          moviesList[index].genreIds),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
