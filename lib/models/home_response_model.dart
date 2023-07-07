import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'home_response_model.g.dart';

@immutable
@JsonSerializable()
class HomeScreenResponse {
  final bool success;
  @JsonKey(name: 'trandingMovies')
  final List<Movie> trendingMovies;
  final List<Movie> nowPlayingMovies;
  final List<Movie> topRatedMovies;

  const HomeScreenResponse({
    required this.success,
    required this.trendingMovies,
    required this.nowPlayingMovies,
    required this.topRatedMovies,
  });

  factory HomeScreenResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeScreenResponseToJson(this);
}
