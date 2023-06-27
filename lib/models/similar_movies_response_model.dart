import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'similar_movies_response_model.g.dart';

@immutable
@JsonSerializable()
class SimilarMoviesResponse {
  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  const SimilarMoviesResponse(
      {required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults});

  factory SimilarMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$SimilarMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SimilarMoviesResponseToJson(this);
}
