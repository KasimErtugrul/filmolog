
import '../../domain/domain.dart';

class MovieListModel extends MovieListEntity {
  const MovieListModel({
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory MovieListModel.fromMap(Map<String, dynamic> json) => MovieListModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<MovieListPopularResultModel>.from(json["results"]!
                .map((x) => MovieListPopularResultModel.fromMap(x))),
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

class MovieListPopularResultModel extends MovieListResultEntity {
  const MovieListPopularResultModel({
    super.adult,
    super.backdropPath,
    super.genreIds,
    super.id,
    super.originalLanguage,
    super.originalTitle,
    super.overview,
    super.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    super.voteCount,
  });

  factory MovieListPopularResultModel.fromMap(Map<String, dynamic> json) =>
      MovieListPopularResultModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
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
}
