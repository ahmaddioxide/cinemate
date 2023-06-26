import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'popular_movies_response_model.g.dart';

@JsonSerializable()
class PopularMoviesResponse {
  int page;
  List<Movie> results;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;

  PopularMoviesResponse(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesResponseToJson(this);
}
