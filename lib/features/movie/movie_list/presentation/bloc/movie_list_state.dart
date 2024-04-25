part of 'movie_list_bloc.dart';

class MovieListState extends Equatable {
  final List<MovieListResultEntity> movieListPopularList;
  final List<MovieListResultEntity> movieListNowPlayingList;
  final bool popularListLoaded;
  final bool nowPlayingListLoaded;

  const MovieListState({
    this.movieListPopularList = const [],
    this.movieListNowPlayingList = const [],
    this.popularListLoaded = false,
    this.nowPlayingListLoaded = false,
  });

  MovieListState copyWith({
    List<MovieListResultEntity>? movieListPopularList,
    List<MovieListResultEntity>? movieListNowPlayingList,
    bool? popularListLoaded,
    bool? nowPlayingListLoaded,
  }) {
    return MovieListState(
      movieListPopularList: movieListPopularList ?? this.movieListPopularList,
      movieListNowPlayingList:
          movieListNowPlayingList ?? this.movieListNowPlayingList,
      popularListLoaded: popularListLoaded ?? this.popularListLoaded,
      nowPlayingListLoaded: nowPlayingListLoaded ?? this.nowPlayingListLoaded,
    );
  }

  @override
  List<Object> get props => [
        movieListPopularList,
        movieListNowPlayingList,
        popularListLoaded,
        nowPlayingListLoaded
      ];

  @override
  String toString() {
    return 'MovieListState{movieListPopularList=$movieListPopularList, movieListNowPlayingList=$movieListNowPlayingList, popularListLoaded=$popularListLoaded, nowPlayingListLoaded=$nowPlayingListLoaded}';
  }
}
