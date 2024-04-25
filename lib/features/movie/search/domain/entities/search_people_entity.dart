import 'package:equatable/equatable.dart';

class SearchPeopleEntity extends Equatable {
  final int? page;
  final List<SearchPeopleResultEntity>? results;
  final int? totalPages;
  final int? totalResults;

  const SearchPeopleEntity({
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

class SearchPeopleResultEntity extends Equatable {
  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final List<SearchPeopleKnownForEntity>? knownFor;

  const SearchPeopleResultEntity({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.knownFor,
  });
  Map<String, dynamic> toMap() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for_department": knownForDepartment,
        "name": name,
        "original_name": originalName,
        "popularity": popularity,
        "profile_path": profilePath,
        "known_for": knownFor == null
            ? []
            : List<dynamic>.from(knownFor!.map((x) => x.toMap())),
      };
  @override
  List<Object?> get props {
    return [
      adult,
      gender,
      id,
      knownForDepartment,
      name,
      originalName,
      popularity,
      profilePath,
      knownFor,
    ];
  }
}

class SearchPeopleKnownForEntity extends Equatable {
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
  final String? originalTitle;
  final String? title;
  final String? releaseDate;
  final bool? video;

  const SearchPeopleKnownForEntity({
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
    this.originalTitle,
    this.title,
    this.releaseDate,
    this.video,
  });
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
        "original_title": originalTitle,
        "title": title,
        "release_date": releaseDate,
        "video": video,
      };
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
      originalTitle,
      title,
      releaseDate,
      video,
    ];
  }
}
