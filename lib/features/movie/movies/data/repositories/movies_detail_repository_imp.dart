import 'package:dartz/dartz.dart';
import 'package:filmolog/features/movie/movies/domain/entities/movies_detail_sim_reco_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../../domain/domain.dart';
import '../data.dart';

@LazySingleton(as: MoviesDetailRepository)
class MoviesDetailRepositoryImp extends MoviesDetailRepository {
  final MoviesDetailRemoteDatasource moviesDetailRemoteDatasource = getIt();

  @override
  Future<Either<Failure, MoviesDetailEntity>> getMoviesDetail(
      int movieId) async {
    try {
      var result = await moviesDetailRemoteDatasource.getMoviesDetail(movieId);

      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesImagesEntity>> getMoviesImages(
      int movieId) async {
    try {
      var result = await moviesDetailRemoteDatasource.getMoviesImages(movieId);

      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MoviesDetailSimRecoEntity>> getMoviesSimilar(
      {required int movieId, int page=1}) async {
    try {
      var result = await moviesDetailRemoteDatasource.getMoviesSimilar(movieId: movieId, page: page);

      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
  
  @override
  Future<Either<Failure, MoviesDetailSimRecoEntity>> getMoviesRecommend({required int movieId, int page = 1}) async{
    try {
      var result = await moviesDetailRemoteDatasource.getMoviesRecommend(movieId: movieId, page: page);

      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
