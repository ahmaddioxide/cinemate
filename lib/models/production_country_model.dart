import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_country_model.g.dart';

@immutable
@JsonSerializable()
class ProductionCountry {
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;

  const ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}
