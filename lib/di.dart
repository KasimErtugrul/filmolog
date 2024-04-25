//import 'package:filmolog/features/movie/movies/data/repositories/movies_detail_repository_imp.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
//import 'features/features.dart';
import 'di.config.dart';
final getIt = GetIt.instance;
@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true, 
  asExtension: true,
)
 configureDependencies()  => getIt.init();
/*
class DiApp {
  static void init() {
    /// -- MOVIE LIST -- ///
    getIt.registerLazySingleton<MovieListRemote>(() => MovieListRemote());
    getIt.registerLazySingleton<MovieListRemoteDatasource>(
        () => MovieListRemoteDatasourceImpl());
    getIt.registerLazySingleton<MovieListRepository>(
        () => MovieListRepositoryImp());
    getIt.registerLazySingleton<MovieListPopularUsecase>(
        () => MovieListPopularUsecase());
    getIt.registerLazySingleton<MovieListNowPlayingUsecase>(
        () => MovieListNowPlayingUsecase());
    getIt.registerFactory<MovieListBloc>(() => MovieListBloc());

    /// -- DISCOVERY -- ///
    getIt.registerLazySingleton<DiscoveryMoviesRemote>(
        () => DiscoveryMoviesRemote());
    getIt.registerLazySingleton<DiscoveryMoviesRemoteDatasource>(
        () => DiscoveryMoviesRemoteDatasourceImp());
    getIt.registerLazySingleton<DiscoveryRepository>(
        () => DiscoveryRepositoryImp());
    getIt.registerLazySingleton<FutureMoviesUseacase>(
        () => FutureMoviesUseacase());
    getIt.registerLazySingleton<NowPlayingTRMoviesUseacase>(
        () => NowPlayingTRMoviesUseacase());
    getIt.registerLazySingleton<FutureTVDiscoveryUsecase>(
        () => FutureTVDiscoveryUsecase());
    getIt.registerFactory<DiscoveryBloc>(() => DiscoveryBloc());

    /// -- COLLECTION -- ///
    getIt.registerLazySingleton<CollectionRemote>(() => CollectionRemote());
    getIt.registerLazySingleton<CollectionRemoteDatasource>(
        () => CollectionRemoteDatasourceImp());
    getIt.registerLazySingleton<CollectionRepository>(
        () => CollectionRepositoryImp());
    getIt.registerLazySingleton<CollectionDetailUsecase>(
        () => CollectionDetailUsecase());
    getIt.registerFactory<CollectionBloc>(() => CollectionBloc());

    /// -- MOVIES -- ///
    getIt.registerLazySingleton<MoviesDetailRemote>(() => MoviesDetailRemote());
    getIt.registerLazySingleton<MoviesDetailRemoteDatasource>(
        () => MoviesDetailRemoteDatasourceImpl());
    getIt.registerLazySingleton<MoviesDetailRepository>(
        () => MoviesDetailRepositoryImp());
    getIt.registerLazySingleton<MoviesDetailUsecase>(
        () => MoviesDetailUsecase());
    getIt.registerLazySingleton<MoviesImagesUsecase>(
        () => MoviesImagesUsecase());
    getIt.registerFactory<MoviesBloc>(() => MoviesBloc());
  }
}
*/