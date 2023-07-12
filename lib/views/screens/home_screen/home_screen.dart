import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemate/providers/home_screen_provider.dart';
import 'package:cinemate/constants/extensions.dart';
import 'package:cinemate/constants/strings.dart';
import 'package:cinemate/models/home_response_model.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:cinemate/views/components_shared/movie_list_horozontal_shimmer_skeleton.dart';
import 'package:cinemate/views/screens/home_screen/movies_list_horizontal.dart';
import 'package:cinemate/views/screens/now_playing_movies_screen/now_playing_movies_screen.dart';
import 'package:cinemate/views/screens/popular_movies_with_genres/genres_selection_screen.dart';
import 'package:cinemate/views/screens/search_movies_with_keywords_screen/search_movies_with_keywords_screen.dart';
import 'package:cinemate/views/screens/top_rated_movies_screen/top_rated_movies_screen.dart';
import 'package:cinemate/views/screens/trending_movies_screen/trending_movies_screen.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme();
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final homeScreenProviderResponse = ref.watch(homeScreenProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GenreSelectionScreen(),
            ),
          );
        },
        label: Text(
          homeScreenFAB,
          style: textTheme.titleMedium!.copyWith(color: darkAccent),
        ),
      ),
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
                      welcome,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      appName,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.red,
                              ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                  onFieldSubmitted: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchMoviesWithKeywordsScreen(keywords: value),
                      ),
                    );
                  },
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
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
                      trendingMovies,
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
                        seeAll,
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
                      wentWrong,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  loading: () => const HorizontalMovieListShimmerEffect(),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      nowPlayingMovies,
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
                        seeAll,
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
                    movies: homeScreenResponse.nowPlayingMovies,
                  ),
                  error: (e, _) => Center(
                    child: Text(
                      wentWrong,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  loading: () => const HorizontalMovieListShimmerEffect(),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      topRatedMovies,
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
                        seeAll,
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
                    movies: homeScreenResponse.topRatedMovies,
                  ),
                  error: (e, _) => Center(
                    child: Text(
                      wentWrong,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  loading: () => const HorizontalMovieListShimmerEffect(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
