// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class MoviesDetailSimRecoEntity extends Equatable {
  final int? page;
  final List<MovieSimRecoResultEntity>? results;
  final int? totalPages;
  final int? totalResults;

  const MoviesDetailSimRecoEntity({
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

class MovieSimRecoResultEntity extends Equatable {
  final String? backdropPath;
  final int? id;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool? adult;
  final String? title;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieSimRecoResultEntity({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.adult,
    this.title,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  Map<String, dynamic> toMap() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "media_type": mediaType,
        "adult": adult,
        "title": title,
        "original_language": originalLanguage,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "popularity": popularity,
        "release_date": releaseDate,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
  @override
  List<Object?> get props {
    return [
      backdropPath,
      id,
      originalTitle,
      overview,
      posterPath,
      mediaType,
      adult,
      title,
      originalLanguage,
      genreIds,
      popularity,
      releaseDate,
      video,
      voteAverage,
      voteCount,
    ];
  }
}
