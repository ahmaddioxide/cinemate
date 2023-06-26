import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'trending_movies_response_model.g.dart';

@JsonSerializable()
class TrendingMoviesResponse {
  int page;
  List<Movie> results;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;

  TrendingMoviesResponse(
      {required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults});

  factory TrendingMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingMoviesResponseToJson(this);
}
