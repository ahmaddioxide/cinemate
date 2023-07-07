import 'package:cinemate/models/home_response_model.dart';
import 'package:cinemate/providers/home_screen_provider.dart';
import 'package:cinemate/views/screens/home_screen/movies_list_horizontal.dart';
import 'package:cinemate/views/screens/now_playing_movies_screen/now_playing_movies_screen.dart';
import 'package:cinemate/views/screens/popular_movies_screen/top_rated_movies_screen.dart';
import 'package:cinemate/views/screens/trending_movies_screen/trending_movies_screen.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final homeScreenProviderResponse = ref.watch(homeScreenProvider);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
        ),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome To',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      'CineMate',
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.red,
                              ),
                    ),
                  ],
                ),
//searchBar
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onFieldSubmitted: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Search Movies',
                    hintStyle:
                        Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.grey[400],
                            ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: darkAccent,
                    ),
                    filled: true,
                    fillColor: Colors.grey[800],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey[800]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey[800]!,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending Movies',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TrendingMoviesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'See All',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.red,
                                ),
                      ),
                    ),
                  ],
                ),
                homeScreenProviderResponse.when(
                  data: (HomeScreenResponse homeScreenResponse) =>
                      HorizontalMoviesList(
                    movies: homeScreenResponse.trendingMovies,
                  ),
                  error: (e, _) => Center(
                    child: Text(
                      'Something went wrong $e',
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
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Now Playing',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const NowPlayingMoviesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'See All',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.red,
                                ),
                      ),
                    ),
                  ],
                ),
                homeScreenProviderResponse.when(
                  data: (HomeScreenResponse homeScreenResponse) =>
                      HorizontalMoviesList(
                          movies: homeScreenResponse.nowPlayingMovies),
                  error: (e, _) => Center(
                    child: Text(
                      'Something went wrong $e',
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
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Rated Movies',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TopRatedMoviesScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'See All',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.red,
                                ),
                      ),
                    ),
                  ],
                ),
                homeScreenProviderResponse.when(
                  data: (HomeScreenResponse homeScreenResponse) =>
                      HorizontalMoviesList(
                          movies: homeScreenResponse.topRatedMovies),
                  error: (e, _) => Center(
                    child: Text(
                      'Something went wrong $e',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
