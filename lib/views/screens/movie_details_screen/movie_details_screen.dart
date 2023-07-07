import 'package:cinemate/constants/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cinemate/providers/movie_detail_provider.dart';
import 'package:cinemate/services/process_image_link.dart';
import 'package:cinemate/constants/assets.dart';
import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/cast_list.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/crew_list.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/movie_tile_with_rating.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/production_companies_card.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/similar_movies_list.dart';


class MovieDetailsScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailProvider = ref.watch(movieDetailsProvider(movieId));
    // final size=context.size;
    // double height = size.height;
    // double width = size.width;
    final textTheme=context.textTheme();
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;


    //TODO


    return Scaffold(
      backgroundColor: dark[800],
      body: movieDetailProvider.when(
        data: (Movie movie) => CustomScrollView(
          slivers: [
            SliverAppBar(
              // pinned: true,
              expandedHeight: height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  movie.title,
                  style: textTheme.titleMedium,
                ),
                centerTitle: true,
                background: FadeInImage.assetNetwork(
                  placeholder: placeholder,
                  image: ProcessImage.processPosterLink(
                    movie.backdropPath ?? movie.posterPath,
                  ),
                  fit: BoxFit.cover,
                  width: width,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    // height: height * 2,
                    width: width,
                    decoration: BoxDecoration(
                      color: dark[800],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: double.infinity),
                          MovieTileWithRating(
                            posterPath: movie.posterPath,
                            originalTitle: movie.originalTitle,
                            genres: movie.genres,
                            releaseDate: movie.releaseDate,
                            voteAverage: movie.voteAverage,
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            'Overview',
                            style: context.textTheme().titleLarge,
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            movie.overview,
                            style: textTheme.titleSmall,
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            'Cast',
                            style: context.textTheme().titleLarge,
                          ),
                          CastList(
                            movieId: movie.id,
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            'Crew',
                            style: textTheme.titleLarge,
                          ),
                          CrewList(movieId: movie.id),
                          SizedBox(height: height * 0.02),
                          Text(
                            'Production Companies',
                            style: textTheme.titleLarge,
                          ),
                          SizedBox(height: height * 0.01),
                          ProductionCompaniesList(productionCompanies: movie.productionCompanies ?? []),
                          SizedBox(height: height * 0.02),
                          Text('Similar Movies', style: textTheme.titleLarge,),
                          SizedBox(height: height * 0.01),
                          SimilarMoviesList(movieId: movie.id,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        error: (e, _) => Center(
          child: Text(
            'Something went wrong',
            style: textTheme.titleMedium,
          ),
        ),
        loading: () => const Center(
          child: SpinKitThreeBounce(
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
