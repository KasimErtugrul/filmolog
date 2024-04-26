
import 'package:filmolog/features/movie/discovery/data/models/future_movies_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../di.dart';
import '../data.dart';

abstract class DiscoveryMoviesRemoteDatasource {
  Future<FutureMoviesModel> getFutureMovies({int page = 1});
  Future<FutureMoviesModel> getNowPlayingTurkishMovies({int page = 1});
  Future<FutureTvDiscoveryModel> getFutureTVDiscovery({int page = 1});

  Future<DiscoveryWithCastModel> getDiscoveryWithCast(
      {required String peopleId1, required String peopleId2});
}

@LazySingleton(as: DiscoveryMoviesRemoteDatasource)
class DiscoveryMoviesRemoteDatasourceImp
    extends DiscoveryMoviesRemoteDatasource {
  final DiscoveryMoviesRemote futureMoviesRemote =
      getIt.get<DiscoveryMoviesRemote>();
  @override
  Future<FutureMoviesModel> getFutureMovies({int page = 1}) async {
   
    return futureMoviesRemote.getFutureTurkishMovies(page: page);
  }

  @override
  Future<FutureMoviesModel> getNowPlayingTurkishMovies({int page = 1}) async {
    return futureMoviesRemote.getNowPlayingTurkishMovies(page: page);
  }

  @override
  Future<FutureTvDiscoveryModel> getFutureTVDiscovery({int page = 1}) async {
    return futureMoviesRemote.getFutureTVDiscovery(page: page);
  }

  @override
  Future<DiscoveryWithCastModel> getDiscoveryWithCast(
      {required String peopleId1, required String peopleId2}) async {
    return futureMoviesRemote.getDiscoveryWithCast(
        peopleId1: peopleId1, peopleId2: peopleId2);
  }
}
