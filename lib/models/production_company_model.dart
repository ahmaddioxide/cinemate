import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'production_company_model.g.dart';

@immutable
@JsonSerializable()
class ProductionCompany {
  final int id;
  @JsonKey(name: 'logo_path')
  final String logoPath;
  final String name;
  @JsonKey(name: 'origin_country')
  final String originCountry;

 const ProductionCompany(
      {required this.id,
      required this.logoPath,
      required this.name,
      required this.originCountry}
      );

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}
