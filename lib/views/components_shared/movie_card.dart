import 'package:cinemate/constants/assets.dart';
import 'package:cinemate/views/components_shared/genre_chip_gery.dart';
import 'package:flutter/material.dart';
import 'package:cinemate/views/theme/theme.dart';

class MovieCard extends StatelessWidget {
  final String movieName;
  final String moviePoster;
  final String movieReleaseDate;
  final String movieRating;
  final String movieOverview;
  final List<String> movieGenres;
  final Function() onTap;

  const MovieCard({
    super.key,
    required this.movieName,
    required this.moviePoster,
    required this.movieReleaseDate,
    required this.movieRating,
    required this.movieGenres,
    required this.movieOverview,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height * 0.3,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: dark[800],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.assetNetwork(
                    placeholder: placeholder,
                    image: moviePoster,
                    fit: BoxFit.cover,
                    height: height * 0.3,
                    width: width * 0.3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.58,
                      child: Text(
                        // movieName.length > 20 ? '${movieName.substring(0, 20)}...' : movieName,
                        movieName,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          movieReleaseDate,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(width: 15),
                        Text(
                          '|',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(width: 15),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          movieRating,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    // SizedBox(height: height * 0.01),
                    SizedBox(
                      width: width * 0.58,
                      // height: height * 0.1,
                      child: Text(
                        movieOverview,
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    SizedBox(
                      height: height * 0.035,
                      width: width * 0.58,
                      // width: width * 0.,
                      child: ListView.builder(
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GenreChip(
                              genre: movieGenres[index],
                            ),
                          );
                        },
                        itemCount: movieGenres.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
