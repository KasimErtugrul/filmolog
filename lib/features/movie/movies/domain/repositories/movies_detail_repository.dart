import 'package:dartz/dartz.dart';
import 'package:filmolog/features/movie/movies/domain/entities/movies_detail_sim_reco_entity.dart';

import '../../../../../core/core.dart';
import '../domain.dart';

abstract class MoviesDetailRepository {
  Future<Either<Failure, MoviesDetailEntity>> getMoviesDetail(int movieId);

  Future<Either<Failure, MoviesImagesEntity>> getMoviesImages(int movieId);
  Future<Either<Failure, MoviesDetailSimRecoEntity>> getMoviesSimilar({required int movieId, int page=1});
  Future<Either<Failure, MoviesDetailSimRecoEntity>> getMoviesRecommend({required int movieId, int page=1});
}
