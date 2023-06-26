import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'now_playing_movies_response_model.g.dart';

@JsonSerializable()
class NowPlayingMoviesResponse {
  int page;
  List<Movie> results;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;
  Map<String,String> dates;

  NowPlayingMoviesResponse(
      {required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
        required this.dates,
      });

  factory NowPlayingMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingMoviesResponseToJson(this);
}
