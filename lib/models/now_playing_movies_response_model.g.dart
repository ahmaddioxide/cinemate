// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_movies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingMoviesResponse _$NowPlayingMoviesResponseFromJson(
        Map<String, dynamic> json,) =>
    NowPlayingMoviesResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
      dates: Map<String, String>.from(json['dates'] as Map),
    );

Map<String, dynamic> _$NowPlayingMoviesResponseToJson(
        NowPlayingMoviesResponse instance,) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'dates': instance.dates,
    };
