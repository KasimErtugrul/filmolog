import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:filmolog/features/movie/discovery/domain/entities/discovery_with_cast_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../../domain/domain.dart';
import '../data.dart';

@LazySingleton(as: DiscoveryRepository)
class DiscoveryRepositoryImp extends DiscoveryRepository {
  final DiscoveryMoviesRemoteDatasource datasourceRemote =
      getIt.get<DiscoveryMoviesRemoteDatasource>();
  @override
  Future<Either<Failure, FutureMoviesEntity>> getFutureTurkishMovies(
      {int page = 1}) async {
    try {
      var remote = await datasourceRemote.getFutureMovies(page: page);
      log('future movies DiscoveryRepositoryImp');
      return Right(remote);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, FutureMoviesEntity>> getnowPlayingTurkishMovies(
      {int page = 1}) async {
    try {
      var remote =
          await datasourceRemote.getNowPlayingTurkishMovies(page: page);
      return Right(remote);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, FutureTvDiscoveryEntity>> getFutureTVDiscovery(
      {int page = 1}) async {
    try {
      var remote = await datasourceRemote.getFutureTVDiscovery(page: page);
      return Right(remote);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DiscoveryWithCastEntity>> getDiscoveryWithCast(
      {required String peopleId1, required String peopleId2}) async {
    try {
      var remote = await datasourceRemote.getDiscoveryWithCast(
          peopleId1: peopleId1, peopleId2: peopleId2);
      return Right(remote);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
