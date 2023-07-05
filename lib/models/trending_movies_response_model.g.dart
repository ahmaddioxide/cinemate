// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_movies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingMoviesResponse _$TrendingMoviesResponseFromJson(
        Map<String, dynamic> json,) =>
    TrendingMoviesResponse(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$TrendingMoviesResponseToJson(
        TrendingMoviesResponse instance,) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
