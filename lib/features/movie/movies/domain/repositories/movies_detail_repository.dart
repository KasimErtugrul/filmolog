import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../domain.dart';

abstract class MoviesDetailRepository {
  Future<Either<Failure, MoviesDetailEntity>> getMoviesDetail(int movieId);

  Future<Either<Failure, MoviesImagesEntity>> getMoviesImages(int movieId);
  Future<Either<Failure, MoviesDetailSimRecoEntity>> getMoviesSimilar({required int movieId, int page=1});
  Future<Either<Failure, MoviesDetailSimRecoEntity>> getMoviesRecommend({required int movieId, int page=1});
}
