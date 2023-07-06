import 'package:cinemate/providers/popular_movies_provider.dart';
import 'package:cinemate/services/process_genre_code.dart';
import 'package:cinemate/services/process_image_link.dart';
import 'package:cinemate/views/screens/movie_details_screen/movie_details_screen.dart';
import 'package:cinemate/views/shared_components/movie_card.dart';
import 'package:cinemate/views/shared_components/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PopularMoviesScreen extends ConsumerStatefulWidget {
  const PopularMoviesScreen({super.key});

  @override
  ConsumerState<PopularMoviesScreen> createState() =>
      _PopularMoviesScreenState();
}

class _PopularMoviesScreenState extends ConsumerState<PopularMoviesScreen> {
  int pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final moviesProvider = ref.watch(popularMoviesProvider(pageNumber));

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
                        onTap: (
                          int pageClicked,
                        ) {
                          setState(() {
                            pageNumber = pageClicked;
                          });
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

// class PopularMoviesAll extends ConsumerWidget {
//   final int pageNumber;
//
//   const PopularMoviesAll({super.key, required this.pageNumber});
//
//   @override
//   // Widget build(BuildContext context, WidgetRef ref) {
//   //   final width = MediaQuery.sizeOf(context).width;
//   //   final moviesProvider = ref.watch(popularMoviesProvider(pageNumber));
//   //
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: Text(
//   //         'Popular Movies',
//   //         style: Theme.of(context).textTheme.headlineSmall,
//   //       ),
//   //       centerTitle: true,
//   //     ),
//   //     body: Padding(
//   //       padding: EdgeInsets.symmetric(
//   //         horizontal: width * 0.02,
//   //         // vertical: height * 0.001,
//   //       ),
//   //       child: SizedBox(
//   //         width: double.infinity,
//   //         child: Column(
//   //           children: [
//   //             Expanded(
//   //               child: moviesProvider.when(
//   //                 data: (popularMoviesResponse) => Column(
//   //                   children: [
//   //                     Expanded(
//   //                       child: ListView.builder(
//   //                         itemCount: popularMoviesResponse.results.length,
//   //                         itemBuilder: (context, i) {
//   //                           final movie = popularMoviesResponse.results[i];
//   //                           return MovieCard(
//   //                             movieName: movie.title,
//   //                             moviePoster: ProcessImage.processImageLink(
//   //                               movie.posterPath,
//   //                             ),
//   //                             movieReleaseDate: movie.releaseDate.toString(),
//   //                             movieRating: movie.voteAverage.toString(),
//   //                             movieGenres: ProcessGenreCode.processGenreCodes(
//   //                               movie.genreIds,
//   //                             ),
//   //                             movieOverview: movie.overview,
//   //                             onTap: () {
//   //                               Navigator.push(
//   //                                 context,
//   //                                 MaterialPageRoute(
//   //                                   builder: (context) => MovieDetailsScreen(
//   //                                     movieId: movie.id,
//   //                                   ),
//   //                                 ),
//   //                               );
//   //                             },
//   //                           );
//   //                         },
//   //                       ),
//   //                     ),
//   //
//   //                     ElevatedButton(
//   //                         onPressed: () {
//   //                           // po.refresh();
//   //                           // Navigator.pushReplacement(
//   //                           //   context,
//   //                           //   MaterialPageRoute(
//   //                           //     builder: (context) => PopularMoviesAll(
//   //                           //       pageNumber: pageNumber + 1,
//   //                           //     ),
//   //                           //   ),
//   //                           // );
//   //                         },
//   //                         child: const Text('Next Page')),
//   //                     // PageIndicator(
//   //                     //   currentPage: popularMoviesResponse.page,
//   //                     //   totalPages: popularMoviesResponse.totalPages,
//   //                     //   onTap: (
//   //                     //     int pageClicked,
//   //                     //   ) {
//   //                     //     Navigator.pushReplacement(
//   //                     //       context,
//   //                     //       MaterialPageRoute(
//   //                     //         builder: (context) => PopularMoviesAll(
//   //                     //           pageNumber: pageClicked,
//   //                     //         ),
//   //                     //       ),
//   //                     //     );},
//   //                     // ),
//   //                   ],
//   //                 ),
//   //                 error: (e, _) => Center(
//   //                   child: Text(
//   //                     'Something went wrong',
//   //                     style: Theme.of(context).textTheme.titleMedium,
//   //                   ),
//   //                 ),
//   //                 loading: () => const Center(
//   //                   child: SpinKitThreeBounce(
//   //                     color: Colors.white,
//   //                     size: 30,
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }
