import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crew_model.g.dart';

@immutable
@JsonSerializable()
class Crew {
  final int id;
  final bool adult;
  final int gender;
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  final double popularity;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final String department;
  final String job;

  const Crew({
    required this.id,
    required this.adult,
    required this.gender,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.department,
    required this.creditId,
    required this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
