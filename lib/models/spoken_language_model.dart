import 'package:json_annotation/json_annotation.dart';

part 'spoken_language_model.g.dart';

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: 'english_name')
  String englishName;
  @JsonKey(name: 'iso_639_1')
  String iso6391;
  String name;

  SpokenLanguage(
      {required this.englishName, required this.iso6391, required this.name}
      );

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
