import 'package:filmolog/features/movie/search/domain/entities/search_multi_entity.dart';

class SearchMultiModel extends SearchMultiEntity {
  const SearchMultiModel({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory SearchMultiModel.fromMap(Map<String, dynamic> json) =>
      SearchMultiModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<SearchMultResultModel>.from(json["results"]!.map((x) => SearchMultResultModel.fromMap(x))),
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

class SearchMultResultModel extends SearchMultiResultEntity {
  const SearchMultResultModel({
    super.backdropPath,
    super.id,
    super.originalName,
    super.overview,
    super.posterPath,
    super.mediaType,
    super.adult,
    super.name,
    super.originalLanguage,
    super.genreIds,
    super.popularity,
    super.firstAirDate,
    super.voteAverage,
    super.voteCount,
    super.originCountry,
    super.gender,
    super.knownForDepartment,
    super.profilePath,
    super.knownFor,
    super.originalTitle,
    super.title,
    super.releaseDate,
    super.video,
  });

  factory SearchMultResultModel.fromMap(Map<String, dynamic> json) => SearchMultResultModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        adult: json["adult"],
        name: json["name"],
        originalLanguage: json["original_language"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        firstAirDate: json["first_air_date"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        gender: json["gender"],
        knownForDepartment: json["known_for_department"],
        profilePath: json["profile_path"],
        knownFor: json["known_for"] == null
            ? []
            : List<SearchMultResultModel>.from(
                json["known_for"]!.map((x) => SearchMultResultModel.fromMap(x))),
        originalTitle: json["original_title"],
        title: json["title"],
        releaseDate: json["release_date"],
        video: json["video"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "adult": adult,
        "name": name,
        "original_language": originalLanguage,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "first_air_date": firstAirDate,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "gender": gender,
        "known_for_department": knownForDepartment,
        "profile_path": profilePath,
        "known_for": knownFor == null
            ? []
            : List<dynamic>.from(knownFor!.map((x) => x.toMap())),
        "original_title": originalTitle,
        "title": title,
        "release_date": releaseDate,
        "video": video,
      };
}
