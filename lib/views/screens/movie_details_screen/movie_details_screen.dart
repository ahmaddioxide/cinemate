import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/services/process_genre_list.dart';
import 'package:cinemate/views/screens/movie_details_screen/components/production_companies_card.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../services/process_image_link.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  // Container(
  // color: Colors.white,
  // width: width,
  // height: height,
  // child: Stack(
  // children: [
  // FadeInImage.assetNetwork(
  // placeholder: 'assets/images/placeholder.png',
  // image: ProcessImage.processPosterLink(
  // '/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg'),
  // fit: BoxFit.cover,
  // width: width,
  // height: height * 0.4,
  // ),
  // Positioned(
  // top: height * 0.35,
  // child: Container(
  // decoration:  BoxDecoration(
  // borderRadius: BorderRadius.only(
  // topLeft: Radius.circular(height * 0.04),
  // topRight: Radius.circular(height * 0.04),
  // ),
  // color: dark[500],
  // ),
  // width: width,
  // height: height * 0.62,
  // ),
  // )
  // ],
  // ),
  // ),
  @override
  Widget build(BuildContext context) {
    // String movieResponse='{"adult":false,"backdrop_path":"/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg","belongs_to_collection":{"id":9485,"name":"The Fast and the Furious Collection","poster_path":"/yvr1Ziehgps1VJyug8nnezTJRJW.jpg","backdrop_path":"/z5A5W3WYJc3UVEWljSGwdjDgQ0j.jpg"},"budget":340000000,"genres":[{"id":28,"name":"Action"},{"id":80,"name":"Crime"},{"id":53,"name":"Thriller"}],"homepage":"https://fastxmovie.com","id":385687,"imdb_id":"tt5433140","original_language":"en","original_title":"Fast X","overview":"Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they"ve ever faced: A terrifying threat emerging from the shadows of the past who"s fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.","popularity":4156.935,"poster_path":"/fiVW06jE7z9YnO4trhaMEdclSiC.jpg","production_companies":[{"id":33,"logo_path":"/8lvHyhjr8oUKOOy2dKXoALWKdp0.png","name":"Universal Pictures","origin_country":"US"},{"id":333,"logo_path":"/5xUJfzPZ8jWJUDzYtIeuPO4qPIa.png","name":"Original Film","origin_country":"US"},{"id":1225,"logo_path":"/rIxhJMR7oK8b2fMakmTfRLY2TZv.png","name":"One Race","origin_country":"US"},{"id":34530,"logo_path":null,"name":"Perfect Storm Entertainment","origin_country":"US"}],"production_countries":[{"iso_3166_1":"US","name":"United States of America"}],"release_date":"2023-05-17","revenue":712100000,"runtime":142,"spoken_languages":[{"english_name":"Italian","iso_639_1":"it","name":"Italiano"},{"english_name":"Portuguese","iso_639_1":"pt","name":"Português"},{"english_name":"Spanish","iso_639_1":"es","name":"Español"}],"status":"Released","tagline":"The end of the road begins.","title":"Fast X","video":false,"vote_average":7.333,"vote_count":2353}';
    final movie = Movie.fromJson(const {
      "adult": false,
      "backdrop_path": "/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg",
      "belongs_to_collection": {
        "id": 9485,
        "name": "The Fast and the Furious Collection",
        "poster_path": "/yvr1Ziehgps1VJyug8nnezTJRJW.jpg",
        "backdrop_path": "/z5A5W3WYJc3UVEWljSGwdjDgQ0j.jpg"
      },
      "budget": 340000000,
      "genres": [
        {"id": 28, "name": "Action"},
        {"id": 80, "name": "Crime"},
        {"id": 53, "name": "Thriller"}
      ],
      "homepage": "https://fastxmovie.com",
      "id": 385687,
      "imdb_id": "tt5433140",
      "original_language": "en",
      "original_title": "Fast X",
      "overview":
          "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
      "popularity": 4156.935,
      "poster_path": "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg",
      "production_companies": [
        {
          "id": 33,
          "logo_path": "/8lvHyhjr8oUKOOy2dKXoALWKdp0.png",
          "name": "Universal Pictures",
          "origin_country": "US"
        },
        {
          "id": 333,
          "logo_path": "/5xUJfzPZ8jWJUDzYtIeuPO4qPIa.png",
          "name": "Original Film",
          "origin_country": "US"
        },
        {
          "id": 1225,
          "logo_path": "/rIxhJMR7oK8b2fMakmTfRLY2TZv.png",
          "name": "One Race",
          "origin_country": "US"
        },
        {
          "id": 34530,
          "logo_path": null,
          "name": "Perfect Storm Entertainment",
          "origin_country": "US"
        }
      ],
      "production_countries": [
        {"iso_3166_1": "US", "name": "United States of America"}
      ],
      "release_date": "2023-05-17",
      "revenue": 712100000,
      "runtime": 142,
      "spoken_languages": [
        {"english_name": "Italian", "iso_639_1": "it", "name": "Italiano"},
        {"english_name": "Portuguese", "iso_639_1": "pt", "name": "Português"},
        {"english_name": "Spanish", "iso_639_1": "es", "name": "Español"}
      ],
      "status": "Released",
      "tagline": "The end of the road begins.",
      "title": "Fast X",
      "video": false,
      "vote_average": 7.333,
      "vote_count": 2353
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
                placeholder: 'assets/images/placeholder.png',
                image: ProcessImage.processPosterLink(
                    movie.backdropPath ?? movie.posterPath),
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
                    height: height * 2,
                    width: width,
                    decoration: BoxDecoration(
                      color: dark[800],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(width: double.infinity),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   width: double.infinity,
                              // ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage.assetNetwork(
                                  width: width * 0.3,
                                  height: height * 0.22,
                                  placeholder: 'assets/images/placeholder.png',
                                  image: ProcessImage.processImageLink(
                                      movie.posterPath),
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
                                      movie.originalTitle,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Text(
                                    ProcessGenre.processGenreList(movie.genres),
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * 0.001,
                                  ),
                                  Text(
                                    movie.releaseDate ?? '',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    width: width * 0.62,
                                    height: height * 0.03,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            '${movie.voteAverage}/10',
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
                                          rating: movie.voteAverage / 2,
                                          itemBuilder: (context, index) =>
                                              const Icon(
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
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Overview',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            movie.overview,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Production Companies',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 10),
                          ProductionCompaniesList(productionCompanies: movie.productionCompanies??[]),
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
