import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'now_playing_movies_response_model.g.dart';

@immutable
@JsonSerializable()
class NowPlayingMoviesResponse {
  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;
  final Map<String, String> dates;

  const NowPlayingMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
    required this.dates,
  });

  factory NowPlayingMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingMoviesResponseToJson(this);
}
