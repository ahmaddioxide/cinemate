import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'top_rated_movies_response_model.g.dart';

@immutable
@JsonSerializable()
class TopRatedMoviesResponse {
  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  const TopRatedMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRatedMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$TopRatedMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMoviesResponseToJson(this);
}
