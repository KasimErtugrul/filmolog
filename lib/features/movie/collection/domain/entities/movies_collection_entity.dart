import 'package:equatable/equatable.dart';

class CollectionEntity extends Equatable {
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final List<CollectionPartEntity>? parts;

  const CollectionEntity({
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.parts,
  });
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "overview": overview,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
        "parts": parts == null
            ? []
            : List<dynamic>.from(parts!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      overview,
      posterPath,
      backdropPath,
      parts,
    ];
  }
}

class CollectionPartEntity extends Equatable {
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

  const CollectionPartEntity({
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

  Map<String, dynamic> toJson() => {
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
