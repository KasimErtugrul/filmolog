
import '../../domain/entities/movies_detail_sim_reco_entity.dart';

class MoviesDetailSimRecoModel extends MoviesDetailSimRecoEntity {
  const MoviesDetailSimRecoModel({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory MoviesDetailSimRecoModel.fromMap(Map<String, dynamic> json) =>
      MoviesDetailSimRecoModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<Result>.from(json["results"]!.map((x) => Result.fromMap(x))),
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

class Result extends MovieSimRecoResultEntity {
  const Result({
    super.backdropPath,
    super.id,
    super.originalTitle,
    super.overview,
    super.posterPath,
    super.mediaType,
    super.adult,
    super.title,
    super.originalLanguage,
    super.genreIds,
    super.popularity,
    super.releaseDate,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        mediaType: json["media_type"],
        adult: json["adult"],
        title: json["title"],
        originalLanguage: json["original_language"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        popularity: json["popularity"]?.toDouble(),
        releaseDate: json["release_date"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  @override
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
}
