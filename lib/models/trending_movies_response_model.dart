import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'trending_movies_response_model.g.dart';

@immutable
@JsonSerializable()
class TrendingMoviesResponse {
  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  const TrendingMoviesResponse(
      {required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults});

  factory TrendingMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingMoviesResponseToJson(this);
}
