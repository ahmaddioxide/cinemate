import 'package:cinemate/repositories/popular_movies_repo.dart';
import 'package:cinemate/views/theme.dart';
import 'package:cinemate/views/trnding_movies_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home:  const TrendingMoviesAll(),
    );
  }
}
class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});
  final HttpPopularMoviesRepo _httpPopularMoviesRepo=HttpPopularMoviesRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            final movies=await _httpPopularMoviesRepo.getPopularMovies(1);
            print(movies);
          },
          child: const Text('Get Popular Movies'),
        ),
      ),
    );
  }
}

