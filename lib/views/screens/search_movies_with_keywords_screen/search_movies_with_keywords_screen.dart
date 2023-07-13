import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemate/providers/page_number_providers.dart';
import 'package:cinemate/providers/search_movies_with_keywords_provider.dart';
import 'package:cinemate/constants/strings.dart';
import 'package:cinemate/constants/extensions.dart';
import 'package:cinemate/helpers/process_genre_code.dart';
import 'package:cinemate/helpers/process_image_link.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:cinemate/views/components_shared/movie_card.dart';
import 'package:cinemate/views/components_shared/movie_list_shimmer_skeleton.dart';
import 'package:cinemate/views/components_shared/page_indicator.dart';
import 'package:cinemate/views/screens/movie_details_screen/movie_details_screen.dart';




class SearchMoviesWithKeywordsScreen extends ConsumerWidget {
  const SearchMoviesWithKeywordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme();
    final width = MediaQuery.of(context).size.width;
    final moviesProvider =
    ref.watch(searchMovieWithKeywordsProvider(ref.read(searchKeywordsProvider).toString()));
    final searchBarController = TextEditingController();

    final searchKeywords = ref.watch(searchKeywordsProvider).toString();
    final isSearchEmpty = searchKeywords.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          searchKeywords.isEmpty?'Search with Keywords': 'Results for "$searchKeywords"',
          style: textTheme.headlineMedium!.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.02),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: searchBarController,
                onSubmitted: (value) {
                  ref.read(searchKeywordsProvider.notifier).state = value;
                  ref.read(searchMoviesWithKeywordsPageNumberProvider.notifier).setPageNumber(1);
                },
                style: textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Search Movies',
                  hintStyle: textTheme.titleMedium!.copyWith(
                    color: Colors.grey[400],
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: darkAccent,
                  ),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Expanded(
                child: moviesProvider.when(
                  data: (searchMoviesWithKeywordsResponse) {
                    if (searchMoviesWithKeywordsResponse.results.isEmpty) {
                      return Center(
                        child: isSearchEmpty
                            ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.search_rounded,color: darkAccent,size: 100,),
                            Text(
                              pleaseSearch,
                              style: textTheme.titleMedium,
                            )
                          ],
                        ) :Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.not_interested_rounded,color: darkAccent,size: 100,),
                            Text(
                              noResultFound,
                              style: textTheme.titleMedium,
                            )
                          ],
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: searchMoviesWithKeywordsResponse.results.length,
                              itemBuilder: (context, i) {
                                final movie = searchMoviesWithKeywordsResponse.results[i];
                                return MovieCard(
                                  movieName: movie.title,
                                  moviePoster: ProcessImage.processImageLink(movie.posterPath),
                                  movieReleaseDate: movie.releaseDate.toString(),
                                  movieRating: movie.voteAverage.toString(),
                                  movieGenres: ProcessGenreCode.processGenreCodes(movie.genreIds),
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
                                  .read(searchMoviesWithKeywordsPageNumberProvider.notifier)
                                  .setPageNumber(pageClicked);
                            },
                            scrollController: ScrollController(
                              initialScrollOffset: (searchMoviesWithKeywordsResponse.page - 1) * (width * 0.07 + width * 0.01),
                            ),
                          ),
                        ],
                      );
                    }
                  },
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
