import 'package:cinemate/providers/popular_movies_provider.dart';
import 'package:cinemate/services/process_genre_code.dart';
import 'package:cinemate/services/process_image_link.dart';
import 'package:cinemate/views/screens/movie_details_screen.dart';
import 'package:cinemate/views/shared_components/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularMoviesAll extends ConsumerWidget {
  const PopularMoviesAll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final moviesProvider = ref.watch(popularMoviesProvider(1));

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
              Expanded(
                child: moviesProvider.when(
                  data: (movies) => ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, i) {
                      final movie = movies[i];
                      return MovieCard(
                        movieName: movie.title,
                        moviePoster: ProcessImage.processImageLink(
                          movie.posterPath,
                        ),
                        movieReleaseDate: movie.releaseDate.toString(),
                        movieRating: movie.voteAverage.toString(),
                        movieGenres: ProcessGenreCode.processGenreCodes(
                          movie.genreIds,
                        ),
                        movieOverview: movie.overview,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetailsScreen(
                                movieId: movie.id,
                              ),
                            ),
                          );
                        },
                      );

                    },
                  ),
                  error: (e, _) => Center(
                    child: Text(
                      'Something went wrong',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
