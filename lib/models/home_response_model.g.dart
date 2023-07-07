// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenResponse _$HomeScreenResponseFromJson(Map<String, dynamic> json) =>
    HomeScreenResponse(
      success: json['success'] as bool,
      trendingMovies: (json['trandingMovies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      nowPlayingMovies: (json['nowPlayingMovies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      topRatedMovies: (json['topRatedMovies'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeScreenResponseToJson(HomeScreenResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'trandingMovies': instance.trendingMovies,
      'nowPlayingMovies': instance.nowPlayingMovies,
      'topRatedMovies': instance.topRatedMovies,
    };
