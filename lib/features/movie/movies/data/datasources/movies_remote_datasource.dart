import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import '../data.dart';
import '../models/movie_detail_sim_reco_model.dart';

abstract class MoviesDetailRemoteDatasource {
  Future<MoviesDetailModel> getMoviesDetail(int movieId);
  Future<MoviesImagesModel> getMoviesImages(int movieId);
  Future<MoviesDetailSimRecoModel> getMoviesSimilar({required int movieId, int page=1});
  Future<MoviesDetailSimRecoModel> getMoviesRecommend({required int movieId, int page=1});
}

@LazySingleton(as: MoviesDetailRemoteDatasource)
class MoviesDetailRemoteDatasourceImpl implements MoviesDetailRemoteDatasource {
  final MoviesDetailRemote moviesDetailRemote = getIt();
  @override
  Future<MoviesDetailModel> getMoviesDetail(int movieId) async {
    return await moviesDetailRemote.getMoviesDetail(movieId);
  }

  @override
  Future<MoviesImagesModel> getMoviesImages(int movieId) async {
    return await moviesDetailRemote.getMoviesImages(movieId);
  }

  @override
  Future<MoviesDetailSimRecoModel> getMoviesSimilar({required int movieId, int page=1}) async {
    return await moviesDetailRemote.getMoviesSimilar(movieId: movieId, page: page);
  }
  
  @override
  Future<MoviesDetailSimRecoModel> getMoviesRecommend({required int movieId, int page = 1}) async{
    return await moviesDetailRemote.getMoviesReco(movieId: movieId, page: page);
  }
}
