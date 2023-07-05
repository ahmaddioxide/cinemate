import 'package:cinemate/constants/assets.dart';
import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/cast_list.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/crew_list.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/movie_tile_with_rating.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/production_companies_card.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:flutter/material.dart';

import '../../../services/process_image_link.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final movie = Movie.fromJson(const {
      'adult': false,
      'backdrop_path': '/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg',
      'belongs_to_collection': {
        'id': 9485,
        'name': 'The Fast and the Furious Collection',
        'poster_path': '/yvr1Ziehgps1VJyug8nnezTJRJW.jpg',
        'backdrop_path': '/z5A5W3WYJc3UVEWljSGwdjDgQ0j.jpg'
      },
      'budget': 340000000,
      'genres': [
        {'id': 28, 'name': 'Action'},
        {'id': 80, 'name': 'Crime'},
        {'id': 53, 'name': 'Thriller'}
      ],
      'homepage': 'https://fastxmovie.com',
      'id': 385687,
      'imdb_id': 'tt5433140',
      'original_language': 'en',
      'original_title': 'Fast X',
      'overview':
          "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
      'popularity': 4156.935,
      'poster_path': '/fiVW06jE7z9YnO4trhaMEdclSiC.jpg',
      'production_companies': [
        {
          'id': 33,
          'logo_path': '/8lvHyhjr8oUKOOy2dKXoALWKdp0.png',
          'name': 'Universal Pictures',
          'origin_country': 'US'
        },
        {
          'id': 333,
          'logo_path': '/5xUJfzPZ8jWJUDzYtIeuPO4qPIa.png',
          'name': 'Original Film',
          'origin_country': 'US'
        },
        {
          'id': 1225,
          'logo_path': '/rIxhJMR7oK8b2fMakmTfRLY2TZv.png',
          'name': 'One Race',
          'origin_country': 'US'
        },
        {
          'id': 34530,
          'logo_path': null,
          'name': 'Perfect Storm Entertainment',
          'origin_country': 'US'
        }
      ],
      'production_countries': [
        {'iso_3166_1': 'US', 'name': 'United States of America'}
      ],
      'release_date': '2023-05-17',
      'revenue': 712100000,
      'runtime': 142,
      'spoken_languages': [
        {'english_name': 'Italian', 'iso_639_1': 'it', 'name': 'Italiano'},
        {'english_name': 'Portuguese', 'iso_639_1': 'pt', 'name': 'Português'},
        {'english_name': 'Spanish', 'iso_639_1': 'es', 'name': 'Español'}
      ],
      'status': 'Released',
      'tagline': 'The end of the road begins.',
      'title': 'Fast X',
      'video': false,
      'vote_average': 7.333,
      'vote_count': 2353
    });

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      // backgroundColor: Colors.,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // pinned: true,
            expandedHeight: height * 0.4,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: Theme.of(context).textTheme.titleMedium,
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
                Expanded(
                  child: Container(
                    // height: height * 2,
                    width: width,
                    decoration: BoxDecoration(
                      color: dark[800],
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
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            'Overview',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            movie.overview,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            'Cast',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          CastList(
                            movieId: movie.id,
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            'Crew',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          CrewList(
                            movieId: movie.id,
                          ),
                          SizedBox(height: height * 0.02),
                          Text(
                            'Production Companies',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: height * 0.01),
                          ProductionCompaniesList(
                            productionCompanies:
                                movie.productionCompanies ?? [],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
