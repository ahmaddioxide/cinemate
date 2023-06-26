import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'similar_movies_response_model.g.dart';

@JsonSerializable()
class SimilarMoviesResponse {
  int page;
  List<Movie> results;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;

  SimilarMoviesResponse(
      {required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults});

  factory SimilarMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$SimilarMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SimilarMoviesResponseToJson(this);
}
