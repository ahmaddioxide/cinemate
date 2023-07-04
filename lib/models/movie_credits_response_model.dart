import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cast_model.dart';
import 'crew_model.dart';

part 'movie_credits_response_model.g.dart';

@immutable
@JsonSerializable()
class MovieCreditsResponse {
  final int id;
  final List<Cast> cast;
  final List<Crew> crew;

  const MovieCreditsResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieCreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditsResponseToJson(this);
}
