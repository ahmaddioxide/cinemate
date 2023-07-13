import 'package:cinemate/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemate/providers/page_number_providers.dart';
import 'package:cinemate/providers/search_movies_with_keywords_provider.dart';
import 'package:cinemate/constants/strings.dart';
import 'package:cinemate/helpers/process_genre_code.dart';
import 'package:cinemate/helpers/process_image_link.dart';
import 'package:cinemate/views/components_shared/movie_card.dart';
import 'package:cinemate/views/components_shared/movie_list_shimmer_skeleton.dart';
import 'package:cinemate/views/components_shared/page_indicator.dart';
import 'package:cinemate/views/screens/movie_details_screen/movie_details_screen.dart';


class SearchMoviesWithKeywordsScreen extends ConsumerWidget {
  final String keywords;

  const SearchMoviesWithKeywordsScreen({super.key, required this.keywords});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final moviesProvider = ref.watch(searchMovieWithKeywordsProvider(keywords));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results for "$keywords"',
          style: Theme.of(context).textTheme.headlineSmall,
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
                  data: (searchMoviesWithKeywordsResponse) => Column(
                    children: [
                      Expanded(

                        child: searchMoviesWithKeywordsResponse.results.isEmpty?
                            Center(
                              child: Text(
                                'No results found',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            )
                            :ListView.builder(
                          itemCount:
                              searchMoviesWithKeywordsResponse.results.length,
                          itemBuilder: (context, i) {
                            final movie =
                                searchMoviesWithKeywordsResponse.results[i];
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
                        currentPage: searchMoviesWithKeywordsResponse.page,
                        totalPages: searchMoviesWithKeywordsResponse.totalPages,
                        onTap: (int pageClicked) {
                          ref
                              .read(
                                searchMoviesWithKeywordsPageNumberProvider
                                    .notifier,
                              )
                              .setPageNumber(pageClicked);
                        },
                        scrollController: ScrollController(
                          initialScrollOffset:
                              (searchMoviesWithKeywordsResponse.page - 1) *
                                  (width * 0.07 + width * 0.01),
                        ),
                      ),
                    ],
                  ),
                  error: (e, _) => Center(
                    child: Text(
                     wentWrong,
                      style: Theme.of(context).textTheme.titleMedium,
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
