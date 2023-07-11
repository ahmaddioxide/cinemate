import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'search_movie_with_keyword_response_model.g.dart';

@immutable
@JsonSerializable()
class SearchMovieWithKeywordResponse {
  final int page;
  final List<Movie> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  const SearchMovieWithKeywordResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchMovieWithKeywordResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchMovieWithKeywordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchMovieWithKeywordResponseToJson(this);
}
