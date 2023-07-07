import 'package:cinemate/constants/assets.dart';
import 'package:cinemate/constants/extensions.dart';
import 'package:cinemate/providers/similar_movies_provider.dart';
import 'package:cinemate/services/process_image_link.dart';
import 'package:cinemate/views/screens/movie_details_screen/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SimilarMoviesList extends ConsumerWidget {
  final int movieId;

  const SimilarMoviesList({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarMoviesFutureProvider = ref.watch(
      similarMoviesProvider(movieId),
    );
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return similarMoviesFutureProvider.when(
      data: (movies) => SizedBox(
        // color: Colors.white,
        height: height * 0.4,
        // width: width,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(
                      movieId: movies[index].id,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: width * 0.45,
                  height: height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 0.5,
                        height: height * 0.34,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                            placeholder: placeholder,
                            image: ProcessImage.processPosterLink(
                              movies[index].posterPath,
                            ),
                            fit: BoxFit.cover,
                            // width: width,
                            // height: height * 0.1,
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Text(
                          movies[index].title,
                          maxLines: 2,
                          style:     context.textTheme().titleSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
      error: (e, _) => Center(
        child: Text(
          e.toString(),
          style: const TextStyle(color: Colors.red),
        ),
      ),
      loading: () => SizedBox(
        height: height * 0.3,
        child: const Center(
          child: SpinKitThreeBounce(
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
