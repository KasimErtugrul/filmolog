part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final bool moviesDetailLoaded;
  final bool moviesImagesLoaded;
  final bool moviesSimilarLoaded;
  final bool moviesRecommendLoaded;
  final MoviesDetailEntity? moviesDetailData;
  final MoviesImagesEntity? moviesImagesData;
  final List<MovieSimRecoResultEntity> moviesSimilarData;
  final List<MovieSimRecoResultEntity> moviesRecommendData;

  const MoviesState({
    this.moviesDetailData,
    this.moviesImagesData,
    this.moviesDetailLoaded = false,
    this.moviesImagesLoaded = false,
    this.moviesSimilarLoaded = false,
    this.moviesSimilarData = const [],
    this.moviesRecommendLoaded = false,
    this.moviesRecommendData = const [],
  });

  MoviesState copyWith({
    MoviesDetailEntity? moviesDetailData,
    bool? moviesDetailLoaded,
    bool? moviesImagesLoaded,
    MoviesImagesEntity? moviesImagesData,
    List<MovieSimRecoResultEntity>? moviesSimilarData,
    bool? moviesSimilarLoaded,
    List<MovieSimRecoResultEntity>? moviesRecommendData,
    bool? moviesRecommendLoaded,
  }) {
    return MoviesState(
      moviesDetailLoaded: moviesDetailLoaded ?? this.moviesDetailLoaded,
      moviesImagesLoaded: moviesImagesLoaded ?? this.moviesImagesLoaded,
      moviesDetailData: moviesDetailData ?? this.moviesDetailData,
      moviesImagesData: moviesImagesData ?? this.moviesImagesData,
      moviesSimilarData: moviesSimilarData ?? this.moviesSimilarData,
      moviesSimilarLoaded: moviesSimilarLoaded ?? this.moviesSimilarLoaded,
      moviesRecommendData: moviesRecommendData ?? this.moviesRecommendData,
      moviesRecommendLoaded:
          moviesRecommendLoaded ?? this.moviesRecommendLoaded,
    );
  }

  @override
  String toString() {
    return 'MoviesState{moviesDetailData=$moviesDetailData, moviesImagesData=$moviesImagesData}';
  }

  @override
  List<Object?> get props {
    return [
      moviesDetailData,
      moviesDetailLoaded,
      moviesImagesLoaded,
      moviesSimilarLoaded,
      moviesImagesData,
      moviesSimilarData,
      moviesRecommendLoaded,
      moviesRecommendData,
    ];
  }
}
