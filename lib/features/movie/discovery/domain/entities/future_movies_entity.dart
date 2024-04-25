import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class FutureMoviesEntity extends Equatable {
  final int? page;
  final List<FutureMoviesResultEntity>? results;
  final int? totalPages;
  final int? totalResults;

    const FutureMoviesEntity({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults
  });


  @override
  List<Object?> get props => [page, results, totalPages, totalResults];
  FutureMoviesEntity copyWith({
    ValueGetter<int?>? page,
    ValueGetter<List<FutureMoviesResultEntity>?>? results,
    ValueGetter<int?>? totalPages,
    ValueGetter<int?>? totalResults    
  }) {
    return FutureMoviesEntity(
          page: page != null ? page() : this.page,
      results: results != null ? results() : this.results,
      totalPages: totalPages != null ? totalPages() : this.totalPages,
      totalResults: totalResults != null ? totalResults() : this.totalResults
    );
  }
}

class FutureMoviesResultEntity extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

    const FutureMoviesResultEntity({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount
  });

 Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount,
    ];
  }
  FutureMoviesResultEntity copyWith({
    ValueGetter<bool?>? adult,
    ValueGetter<String?>? backdropPath,
    ValueGetter<List<int>?>? genreIds,
    ValueGetter<int?>? id,
    ValueGetter<String?>? originalLanguage,
    ValueGetter<String?>? originalTitle,
    ValueGetter<String?>? overview,
    ValueGetter<double?>? popularity,
    ValueGetter<String?>? posterPath,
    ValueGetter<String?>? releaseDate,
    ValueGetter<String?>? title,
    ValueGetter<bool?>? video,
    ValueGetter<double?>? voteAverage,
    ValueGetter<int?>? voteCount    
  }) {
    return FutureMoviesResultEntity(
          adult: adult != null ? adult() : this.adult,
      backdropPath: backdropPath != null ? backdropPath() : this.backdropPath,
      genreIds: genreIds != null ? genreIds() : this.genreIds,
      id: id != null ? id() : this.id,
      originalLanguage: originalLanguage != null ? originalLanguage() : this.originalLanguage,
      originalTitle: originalTitle != null ? originalTitle() : this.originalTitle,
      overview: overview != null ? overview() : this.overview,
      popularity: popularity != null ? popularity() : this.popularity,
      posterPath: posterPath != null ? posterPath() : this.posterPath,
      releaseDate: releaseDate != null ? releaseDate() : this.releaseDate,
      title: title != null ? title() : this.title,
      video: video != null ? video() : this.video,
      voteAverage: voteAverage != null ? voteAverage() : this.voteAverage,
      voteCount: voteCount != null ? voteCount() : this.voteCount
    );
  }
}
