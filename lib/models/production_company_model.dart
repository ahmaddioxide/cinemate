import 'package:json_annotation/json_annotation.dart';

part 'production_company_model.g.dart';

@JsonSerializable()
class ProductionCompany {
  int id;
  @JsonKey(name: 'logo_path')
  String logoPath;
  String name;
  @JsonKey(name: 'origin_country')
  String originCountry;

  ProductionCompany(
      {required this.id,
      required this.logoPath,
      required this.name,
      required this.originCountry}
      );

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}
