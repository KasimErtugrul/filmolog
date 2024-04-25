import 'package:equatable/equatable.dart';

class MoviesImagesEntity extends Equatable {
  final List<ImagesResultEntity>? backdrops;
  final int? id;
  final List<dynamic>? logos;
  final List<ImagesResultEntity>? posters;

  const MoviesImagesEntity({
    this.backdrops,
    this.id,
    this.logos,
    this.posters,
  });

    Map<String, dynamic> toMap() => {
        "backdrops": backdrops == null ? [] : List<dynamic>.from(backdrops!.map((x) => x.toMap())),
        "id": id,
        "logos": logos == null ? [] : List<dynamic>.from(logos!.map((x) => x)),
        "posters": posters == null ? [] : List<dynamic>.from(posters!.map((x) => x.toMap())),
    };
  @override
  List<Object?> get props => [backdrops, id, logos, posters];
}

class ImagesResultEntity extends Equatable {
  final double? aspectRatio;
  final int? height;
  final String? iso6391;
  final String? filePath;
  final double? voteAverage;
  final int? voteCount;
  final int? width;

  const ImagesResultEntity({
    this.aspectRatio,
    this.height,
    this.iso6391,
    this.filePath,
    this.voteAverage,
    this.voteCount,
    this.width,
  });
 Map<String, dynamic> toMap() => {
        "aspect_ratio": aspectRatio,
        "height": height,
        "iso_639_1": iso6391,
        "file_path": filePath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "width": width,
    };
  @override
  List<Object?> get props {
    return [
      aspectRatio,
      height,
      iso6391,
      filePath,
      voteAverage,
      voteCount,
      width,
    ];
  }
}
