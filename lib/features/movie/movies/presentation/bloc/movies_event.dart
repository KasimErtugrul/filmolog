part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieDetail extends MoviesEvent {
  final int movieId;

  const FetchMovieDetail(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class FetchMovieImages extends MoviesEvent {
  final int movieId;

  const FetchMovieImages(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class FetchMovieSimilar extends MoviesEvent {
  final int movieId;
  final int page;
  const FetchMovieSimilar({required this.movieId, this.page = 1});

  @override
  List<Object> get props => [movieId, page];
}
class FetchMovieRecomend extends MoviesEvent {
  final int movieId;
  final int page;
  const FetchMovieRecomend({required this.movieId, this.page = 1});

  @override
  List<Object> get props => [movieId, page];
}