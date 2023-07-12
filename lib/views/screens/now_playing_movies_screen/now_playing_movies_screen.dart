import 'package:cinemate/constants/extensions.dart';
import 'package:cinemate/constants/strings.dart';
import 'package:cinemate/providers/now_playing_movies_provider.dart';
import 'package:cinemate/providers/page_number_providers.dart';
import 'package:cinemate/helpers/process_genre_code.dart';
import 'package:cinemate/helpers/process_image_link.dart';
import 'package:cinemate/views/components_shared/movie_card.dart';
import 'package:cinemate/views/components_shared/movie_list_shimmer_skeleton.dart';
import 'package:cinemate/views/components_shared/page_indicator.dart';
import 'package:cinemate/views/screens/movie_details_screen/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlayingMoviesScreen extends ConsumerWidget {
  const NowPlayingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme=context.textTheme();
    final width = MediaQuery.of(context).size.width;
    final pageNumber = ref.watch(nowPlayingMoviesPageNumberProvider);
    final moviesProvider =
        ref.watch(nowPlayingMoviesProvider(pageNumber.toInt()));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          nowPlayingMovies,
          style: textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: moviesProvider.when(
                  data: (popularMoviesResponse) => Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: popularMoviesResponse.results.length,
                          itemBuilder: (context, i) {
                            final movie = popularMoviesResponse.results[i];
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
                      ),
                      PageIndicator(
                        currentPage: popularMoviesResponse.page,
                        totalPages: popularMoviesResponse.totalPages,
                        onTap: (int pageClicked) {
                          ref
                              .read(nowPlayingMoviesPageNumberProvider.notifier)
                              .setPageNumber(pageClicked);
                        },
                        scrollController: ScrollController(
                          initialScrollOffset:
                              (popularMoviesResponse.page - 1) *
                                  (width * 0.07 + width * 0.01),
                        ),
                      ),
                    ],
                  ),
                  error: (e, _) => Center(
                    child: Text(
                      wentWrong,
                      style: textTheme.titleMedium,
                    ),
                  ),
                  loading: () => const MovieListShimmerEffect(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
