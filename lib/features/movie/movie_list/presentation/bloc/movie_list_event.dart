part of 'movie_list_bloc.dart';

abstract class MovieListEvent extends Equatable {
  const MovieListEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieListPopular extends MovieListEvent {
  final int? page;

  const FetchMovieListPopular({this.page=1});

  @override
  List<Object> get props => [page!];

  @override
  String toString() => 'FetchMovieListPopular { page: $page }';
}

class FetchMovieListNowPlaying extends MovieListEvent {
  final int? page;

  const FetchMovieListNowPlaying({this.page=1});

  @override
  List<Object> get props => [page!];
  @override
  String toString() => 'FetchMovieListNowPlaying { page: $page }';
}
