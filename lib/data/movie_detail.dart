import 'package:json_annotation/json_annotation.dart';

part 'movie_detail.g.dart';

@JsonSerializable()
class MovieDetailModel {
  @JsonKey(name: "adult")
  bool adult;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  @JsonKey(name: "belongs_to_collection")
  dynamic belongsToCollection;
  @JsonKey(name: "budget")
  int budget;
  @JsonKey(name: "genres")
  List<Genre> genres;
  @JsonKey(name: "homepage")
  String homepage;
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "imdb_id")
  String imdbId;
  @JsonKey(name: "origin_country")
  List<String> originCountry;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  @JsonKey(name: "overview")
  String overview;
  @JsonKey(name: "popularity")
  double popularity;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "production_companies")
  List<ProductionCompany> productionCompanies;
  @JsonKey(name: "production_countries")
  List<ProductionCountry> productionCountries;
  @JsonKey(name: "release_date")
  DateTime releaseDate;
  @JsonKey(name: "revenue")
  int revenue;
  @JsonKey(name: "runtime")
  int runtime;
  @JsonKey(name: "spoken_languages")
  List<SpokenLanguage> spokenLanguages;
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "tagline")
  String tagline;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "video")
  bool video;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int voteCount;

  MovieDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);
}

@JsonSerializable()
class Genre {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@JsonSerializable()
class ProductionCompany {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "logo_path")
  String? logoPath;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "origin_country")
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@JsonSerializable()
class ProductionCountry {
  @JsonKey(name: "iso_3166_1")
  String iso31661;
  @JsonKey(name: "name")
  String name;

  ProductionCountry({required this.iso31661, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@JsonSerializable()
class SpokenLanguage {
  @JsonKey(name: "english_name")
  String englishName;
  @JsonKey(name: "iso_639_1")
  String iso6391;
  @JsonKey(name: "name")
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}
