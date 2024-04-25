import '../../domain/domain.dart';

class MoviesImagesModel extends MoviesImagesEntity {
  const MoviesImagesModel({
    super.backdrops,
    super.id,
    super.logos,
    super.posters,
  });

  factory MoviesImagesModel.fromJson(Map<String, dynamic> json) =>
      MoviesImagesModel(
        backdrops: json["backdrops"] == null
            ? []
            : List<ImagesResult>.from(
                json["backdrops"]!.map((x) => ImagesResult.fromMap(x))),
        id: json["id"],
        logos: json["logos"] == null
            ? []
            : List<dynamic>.from(json["logos"]!.map((x) => x)),
        posters: json["posters"] == null
            ? []
            : List<ImagesResult>.from(
                json["posters"]!.map((x) => ImagesResult.fromMap(x))),
      );

  @override
  Map<String, dynamic> toMap() => {
        "backdrops": backdrops == null
            ? []
            : List<dynamic>.from(backdrops!.map((x) => x.toMap())),
        "id": id,
        "logos": logos == null ? [] : List<dynamic>.from(logos!.map((x) => x)),
        "posters": posters == null
            ? []
            : List<dynamic>.from(posters!.map((x) => x.toMap())),
      };
}

class ImagesResult extends ImagesResultEntity {
  const ImagesResult({
    super.aspectRatio,
    super.height,
    super.iso6391,
    super.filePath,
    super.voteAverage,
    super.voteCount,
    super.width,
  });

  factory ImagesResult.fromMap(Map<String, dynamic> json) => ImagesResult(
        aspectRatio: json["aspect_ratio"]?.toDouble(),
        height: json["height"],
        iso6391: json["iso_639_1"],
        filePath: json["file_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        width: json["width"],
      );

  @override
  Map<String, dynamic> toMap() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
      };
}
