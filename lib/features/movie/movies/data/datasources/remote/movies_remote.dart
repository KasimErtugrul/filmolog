import 'dart:developer';

import 'package:injectable/injectable.dart';
import '../../../../../../core/core.dart';
import '../../data.dart';
import '../../models/movie_detail_sim_reco_model.dart';

@LazySingleton()
class MoviesDetailRemote {
  Future<MoviesDetailModel> getMoviesDetail(int movieId) async {
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.movies.getDetails(
      movieId,
      appendToResponse: 'credits,external_ids,keywords,videos,release_dates',
    ) as Map<String, dynamic>;

    // Sonucu döndür
    return MoviesDetailModel.fromJson(result);
  }

  Future<MoviesImagesModel> getMoviesImages(int movieId) async {
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.movies
            .getImages(movieId, includeImageLanguage: 'tr,null')
        as Map<String, dynamic>;
    return MoviesImagesModel.fromJson(result);
  }

  Future<MoviesDetailSimRecoModel> getMoviesSimilar(
      {required int movieId, int page = 1}) async {
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.movies
        .getSimilar(movieId, page: page) as Map<String, dynamic>;
    log('similar: $movieId  ${result['results'].length}');
    return MoviesDetailSimRecoModel.fromMap(result);
  }

  Future<MoviesDetailSimRecoModel> getMoviesReco(
      {required int movieId, int page = 1}) async {
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.movies
        .getRecommended(movieId, page: page) as Map<String, dynamic>;
    log('similar: $movieId  ${result['results'].length}');
    return MoviesDetailSimRecoModel.fromMap(result);
  }
}
