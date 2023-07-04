import 'package:cinemate/repositories/movie_details_repo.dart';
import 'package:flutter/material.dart';


class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movieId.toString(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: HttpMovieDetails().getMovieDetails(movieId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data?.budget.toString() ?? 'No data');
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return const CircularProgressIndicator(
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
