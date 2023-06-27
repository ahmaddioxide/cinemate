import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';

@immutable
@JsonSerializable()
class Genre {
  final int id;
  final String name;

  const Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}


