import 'package:cinemate/constants/assets.dart';
import 'package:cinemate/models/genre_model.dart';
import 'package:cinemate/services/process_genre_list.dart';
import 'package:cinemate/services/process_image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieTileWithRating extends StatelessWidget {
  final String? posterPath;
  final String originalTitle;
  final String? tagline;
  final List<Genre>? genres;
  final String? releaseDate;
  final double voteAverage;

  const MovieTileWithRating({
    super.key,
    this.posterPath,
    required this.originalTitle,
    this.tagline,
    this.genres,
    this.releaseDate,
    required this.voteAverage,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage.assetNetwork(
            width: width * 0.3,
            height: height * 0.22,
            placeholder: placeholder,
            image: ProcessImage.processImageLink(
              posterPath,
            ),
            fit: BoxFit.cover,
            // height: height * 0.,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.62,
              child: Text(
                originalTitle,
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: height * 0.001,
            ),
            SizedBox(
              width: width * 0.62,
              child: Text(
                tagline ?? '',
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 3,
              ),
            ),
            SizedBox(
              height: height * 0.001,
            ),
            Text(
              ProcessGenre.processGenreList(genres),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: height * 0.001,
            ),
            Text(
              releaseDate ?? '',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              width: width * 0.62,
              height: height * 0.03,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      '$voteAverage/10',
                      style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  RatingBarIndicator(
                    unratedColor: Colors.amber[50],
                    rating: voteAverage / 2,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
