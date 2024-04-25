import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../../domain/domain.dart';
import '../data.dart';

@LazySingleton(as: MovieListRepository)
class MovieListRepositoryImp extends MovieListRepository {
  final MovieListRemoteDatasource movieListRemoteDatasource = getIt.get<MovieListRemoteDatasource>();
  @override
  Future<Either<Failure, MovieListEntity>> getMovieListPopular(
      {int page = 1}) async {
    try {
      var result =
          await movieListRemoteDatasource.getMovieListPopular(page: page);
      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieListEntity>> getMovieListNowPlaying(
      {int page = 1}) async {
    try {
      var result =
          await movieListRemoteDatasource.getMovieListNowPlaying(page: page);
      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
