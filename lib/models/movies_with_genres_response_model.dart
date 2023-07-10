import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'movies_with_genres_response_model.g.dart';

@immutable
@JsonSerializable()
class PopularMoviesWithGenresResponse {
  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  const PopularMoviesWithGenresResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMoviesWithGenresResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesWithGenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesWithGenresResponseToJson(this);
}
