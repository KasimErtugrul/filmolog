import '../../domain/domain.dart';

class FutureTvDiscoveryModel extends FutureTvDiscoveryEntity {
  const FutureTvDiscoveryModel({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory FutureTvDiscoveryModel.fromMap(Map<String, dynamic> json) =>
      FutureTvDiscoveryModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<TVDiscoveryResult>.from(json["results"]!.map((x) => TVDiscoveryResult.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class TVDiscoveryResult extends FutureTVDiscoveryResultEntity {
  const TVDiscoveryResult({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originCountry,
    super.originalLanguage,
    super.originalName,
    super.overview,
    super.popularity,
    super.posterPath,
    super.firstAirDate,
    super.name,
    super.voteAverage,
    super.voteCount,
  });

  factory TVDiscoveryResult.fromMap(Map<String, dynamic> json) => TVDiscoveryResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        firstAirDate: json["first_air_date"] ,
        name: json["name"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "first_air_date":
            firstAirDate,
        "name": name,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
