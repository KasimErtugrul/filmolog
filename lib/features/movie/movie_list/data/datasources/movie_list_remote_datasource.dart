import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import '../data.dart';


abstract class MovieListRemoteDatasource {
  Future<MovieListModel> getMovieListPopular({int page = 1});
  Future<MovieListModel> getMovieListNowPlaying({int page = 1});
}

@LazySingleton(as: MovieListRemoteDatasource)
class MovieListRemoteDatasourceImpl implements MovieListRemoteDatasource {
  final MovieListRemote movieListRemote = getIt.get<MovieListRemote>();
  @override
  Future<MovieListModel> getMovieListPopular({int page = 1}) async {
    return movieListRemote.getMovieListPopular(page: page);
  }
  
  @override
  Future<MovieListModel> getMovieListNowPlaying({int page = 1})async {
    return movieListRemote.getMovieListNowPlaying(page: page);
  }
}
