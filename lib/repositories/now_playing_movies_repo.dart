import 'package:cinemate/models/now_playing_movies_response_model.dart';
import 'package:cinemate/services/client/base_client.dart';
import 'package:flutter/material.dart';

abstract class PopularMoviesRepo {
  Future<NowPlayingMoviesResponse> getNowPlayingMoviesResponse([int page = 1]);
}

class HttpNowPlayingMoviesRepo implements PopularMoviesRepo {
  @override
  Future<NowPlayingMoviesResponse> getNowPlayingMoviesResponse(
      [int page = 1]) async {
    NowPlayingMoviesResponse nowPlayingMoviesResponse;
    final String uri =
        '/movie/now_playing?language=en-US&page=${page.toString()}';
    final Map<String, dynamic> response = await BaseClient().get(uri);
    debugPrint(response.toString());
    nowPlayingMoviesResponse = NowPlayingMoviesResponse.fromJson(response);
    return nowPlayingMoviesResponse;
  }
}
