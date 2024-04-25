import 'package:equatable/equatable.dart';

class SearchMultiEntity extends Equatable {
  final int? page;
  final List<SearchMultiResultEntity>? results;
  final int? totalPages;
  final int? totalResults;

  const SearchMultiEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  Map<String, dynamic> toMap() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
}

class SearchMultiResultEntity extends Equatable {
  final String? backdropPath;
  final int? id;
  final String? originalName;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool? adult;
  final String? name;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? firstAirDate;
  final double? voteAverage;
  final int? voteCount;
  final List<String>? originCountry;
  final int? gender;
  final String? knownForDepartment;
  final String? profilePath;
  final List<SearchMultiResultEntity>? knownFor;
  final String? originalTitle;
  final String? title;
  final String? releaseDate;
  final bool? video;
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
  const SearchMultiResultEntity({
    this.backdropPath,
    this.id,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.name,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
    this.knownFor,
    this.originalTitle,
    this.title,
    this.releaseDate,
    this.video,
  });

  @override
  List<Object?> get props {
    return [
      backdropPath,
      id,
      originalName,
      overview,
      posterPath,
      mediaType,
      adult,
      name,
      originalLanguage,
      genreIds,
      popularity,
      firstAirDate,
      voteAverage,
      voteCount,
      originCountry,
      gender,
      knownForDepartment,
      profilePath,
      knownFor,
      originalTitle,
      title,
      releaseDate,
      video,
    ];
  }
}
