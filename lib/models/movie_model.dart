import 'package:json_annotation/json_annotation.dart';

import 'genre_model.dart';
import 'production_company_model.dart';
import 'production_country_model.dart';
import 'spoken_language_model.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class Movie {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  dynamic? belongsToCollection;
  int? budget;
  List<Genre>? genres;
  String? homepage;
  int id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? productionCountries;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  int? revenue;
  int? runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  Movie(
      {required this.adult,
        this.backdropPath,
       this.belongsToCollection,
       this.budget,
       this.genres,
       this.homepage,
      required this.id,
       this.imdbId,
      required this.originalTitle,
      required this.originalLanguage,
      required this.overview,
      required this.popularity,
       this.posterPath,
       this.productionCompanies,
       this.productionCountries,
       this.releaseDate,
       this.revenue,
       this.runtime,
       this.spokenLanguages,
       this.status,
       this.tagline,
      required this.title,
       this.video,
      required this.voteAverage,
      required this.voteCount,
       this.genreIds,
      }
      );


  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
