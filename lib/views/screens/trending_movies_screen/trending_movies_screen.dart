import 'package:cinemate/providers/page_number_providers.dart';
import 'package:cinemate/providers/trending_movies_provider.dart';
import 'package:cinemate/services/process_genre_code.dart';
import 'package:cinemate/services/process_image_link.dart';
import 'package:cinemate/views/components_shared/movie_card.dart';
import 'package:cinemate/views/components_shared/page_indicator.dart';
import 'package:cinemate/views/screens/movie_details_screen/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TrendingMoviesScreen extends ConsumerWidget {
  const TrendingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    final pageNumber = ref.watch(trendingMoviesPageNumberProvider);

    final moviesProvider =
        ref.watch(trendingMoviesProvider(pageNumber.toInt()));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending Movies',
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
                  data: (trendingMoviesResponse) => Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: trendingMoviesResponse.results.length,
                          itemBuilder: (context, i) {
                            final movie = trendingMoviesResponse.results[i];
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
                        currentPage: trendingMoviesResponse.page,
                        totalPages: trendingMoviesResponse.totalPages,
                        onTap: (int pageClicked) {
                          ref
                              .read(trendingMoviesPageNumberProvider.notifier)
                              .setPageNumber(pageClicked);
                        },
                        scrollController: ScrollController(
                          initialScrollOffset:
                              (trendingMoviesResponse.page - 1) *
                                  (width * 0.07 + width * 0.01),
                        ),
                      ),
                    ],
                  ),
                  error: (e, _) => Center(
                    child: Text(
                      'Something went wrong ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  loading: () => const Center(
                    child: SpinKitThreeBounce(
                      color: Colors.white,
                      size: 30,
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
