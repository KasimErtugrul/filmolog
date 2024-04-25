import 'package:dartz/dartz.dart';
import '../../../../../core/core.dart';
import '../domain.dart';

abstract class DiscoveryRepository {
  Future<Either<Failure, FutureMoviesEntity>> getFutureTurkishMovies(
      {int page = 1});
  Future<Either<Failure, FutureMoviesEntity>> getnowPlayingTurkishMovies(
      {int page = 1});

      Future<Either<Failure, FutureTvDiscoveryEntity>> getFutureTVDiscovery(
      {int page = 1});

      Future<Either<Failure, DiscoveryWithCastEntity>> getDiscoveryWithCast(
      {required String peopleId1, required String peopleId2});
}
/*
 Future<DiscoveryWithCastModel> getDiscoveryWithCast(
      {required String peopleId1, required String peopleId2})
*/