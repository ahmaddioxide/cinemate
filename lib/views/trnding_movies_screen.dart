import 'package:cinemate/views/theme.dart';
import 'package:flutter/material.dart';

class TrendingMoviesAll extends StatelessWidget {
  const TrendingMoviesAll({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending Movies',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.01,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              const MovieTileHorizontal(
                  movieName: 'Fast X',
                  moviePoster:
                      'https://image.tmdb.org/t/p/w500/fiVW06jE7z9YnO4trhaMEdclSiC.jpg',
                  movieReleaseDate: '2023-05-17',
                  movieRating: '7.3',
                  movieGenres: ['Action', 'Adventure', 'Crime']),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieTileHorizontal extends StatelessWidget {
  final String movieName;
  final String moviePoster;
  final String movieReleaseDate;
  final String movieRating;
  final List<String> movieGenres;

  const MovieTileHorizontal(
      {super.key,
      required this.movieName,
      required this.moviePoster,
      required this.movieReleaseDate,
      required this.movieRating,
      required this.movieGenres});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.25,
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
              child: Image.network(
                moviePoster,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      movieReleaseDate,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '|',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      movieRating,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                SizedBox(
                  height: height * 0.035,
                  // width: width * 0.,
                  child: ListView.builder(
                    itemBuilder: (
                      context,
                      index,
                    ) {
                      return  Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: GenreChip(
                          genre: movieGenres[index],
                        ),
                      );
                    },
                    itemCount: movieGenres.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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

class GenreChip extends StatelessWidget {
  final String genre;

  const GenreChip({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: dark[200],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: Text(
        genre,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
