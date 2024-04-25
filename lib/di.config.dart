// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/movie/collection/collection.dart' as _i34;
import 'features/movie/collection/data/datasources/collection_remote_datasource.dart'
    as _i42;
import 'features/movie/collection/data/datasources/remote/collection_remote.dart'
    as _i10;
import 'features/movie/collection/data/repositories/collection_repository_imp.dart'
    as _i35;
import 'features/movie/collection/domain/usecases/movies_collection_detail_usecase.dart'
    as _i11;
import 'features/movie/collection/presentation/bloc/collection_bloc.dart'
    as _i3;
import 'features/movie/discovery/data/datasources/discovery_movies_remote_datasource.dart'
    as _i38;
import 'features/movie/discovery/data/datasources/remote/discovery_remote.dart'
    as _i12;
import 'features/movie/discovery/data/repositories/discovery_repository_imp.dart'
    as _i41;
import 'features/movie/discovery/domain/domain.dart' as _i40;
import 'features/movie/discovery/domain/usecases/discovery_with_cast_usecase.dart'
    as _i13;
import 'features/movie/discovery/domain/usecases/future_movies_useacase.dart'
    as _i14;
import 'features/movie/discovery/domain/usecases/future_turkish_nowplaying_usecase.dart'
    as _i15;
import 'features/movie/discovery/domain/usecases/future_tv_discovery_usecase.dart'
    as _i16;
import 'features/movie/discovery/presentation/bloc/discovery_bloc.dart' as _i4;
import 'features/movie/movie_list/data/datasources/movie_list_remote_datasource.dart'
    as _i32;
import 'features/movie/movie_list/data/datasources/remote/movie_list_remote.dart'
    as _i20;
import 'features/movie/movie_list/data/repositories/movie_list_repository_imp.dart'
    as _i37;
import 'features/movie/movie_list/domain/domain.dart' as _i36;
import 'features/movie/movie_list/domain/usecases/movie_list_now_playing_usecase.dart'
    as _i21;
import 'features/movie/movie_list/domain/usecases/movie_list_popular_usecase.dart'
    as _i22;
import 'features/movie/movie_list/presentation/bloc/movie_list_bloc.dart'
    as _i7;
import 'features/movie/movies/data/datasources/movies_remote_datasource.dart'
    as _i33;
import 'features/movie/movies/data/datasources/remote/movies_remote.dart'
    as _i17;
import 'features/movie/movies/data/repositories/movies_detail_repository_imp.dart'
    as _i31;
import 'features/movie/movies/domain/domain.dart' as _i30;
import 'features/movie/movies/domain/usecases/movie_detail_recommend_usecase.dart'
    as _i29;
import 'features/movie/movies/domain/usecases/movies_detail_similar_usecase.dart'
    as _i28;
import 'features/movie/movies/domain/usecases/movies_detail_usecase.dart'
    as _i18;
import 'features/movie/movies/domain/usecases/movies_images_usecase.dart'
    as _i19;
import 'features/movie/movies/presentation/bloc/movies_bloc.dart' as _i5;
import 'features/movie/movies/presentation/cubit/cubit/cast_cubit.dart' as _i6;
import 'features/movie/people/data/datasource/people_remote_datasource.dart'
    as _i43;
import 'features/movie/people/data/datasource/remote/people_remote.dart'
    as _i23;
import 'features/movie/people/data/repository/people_repository_impl.dart'
    as _i45;
import 'features/movie/people/domain/domain.dart' as _i44;
import 'features/movie/people/domain/usecase/people_usecase.dart' as _i24;
import 'features/movie/people/presentation/people_bloc/people_bloc.dart' as _i8;
import 'features/movie/search/data/datasources/remote/search_remote.dart'
    as _i25;
import 'features/movie/search/data/datasources/search_remote_datasource.dart'
    as _i39;
import 'features/movie/search/data/repositories/search_repository_impl.dart'
    as _i47;
import 'features/movie/search/domain/repositories/search_repository.dart'
    as _i46;
import 'features/movie/search/domain/usecases/search_multi_usecase.dart'
    as _i26;
import 'features/movie/search/domain/usecases/search_people_usecase.dart'
    as _i27;
import 'features/movie/search/presentation/bloc/search_bloc.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CollectionBloc>(() => _i3.CollectionBloc());
    gh.factory<_i4.DiscoveryBloc>(() => _i4.DiscoveryBloc());
    gh.factory<_i5.MoviesBloc>(() => _i5.MoviesBloc());
    gh.factory<_i6.CastCubit>(() => _i6.CastCubit());
    gh.factory<_i7.MovieListBloc>(() => _i7.MovieListBloc());
    gh.factory<_i8.PeopleBloc>(() => _i8.PeopleBloc());
    gh.factory<_i9.SearchBloc>(() => _i9.SearchBloc());
    gh.lazySingleton<_i10.CollectionRemote>(() => _i10.CollectionRemote());
    gh.lazySingleton<_i11.CollectionDetailUsecase>(
        () => _i11.CollectionDetailUsecase());
    gh.lazySingleton<_i12.DiscoveryMoviesRemote>(
        () => _i12.DiscoveryMoviesRemote());
    gh.lazySingleton<_i13.DiscoveryWithCastUsecase>(
        () => _i13.DiscoveryWithCastUsecase());
    gh.lazySingleton<_i14.FutureMoviesUseacase>(
        () => _i14.FutureMoviesUseacase());
    gh.lazySingleton<_i15.NowPlayingTRMoviesUseacase>(
        () => _i15.NowPlayingTRMoviesUseacase());
    gh.lazySingleton<_i16.FutureTVDiscoveryUsecase>(
        () => _i16.FutureTVDiscoveryUsecase());
    gh.lazySingleton<_i17.MoviesDetailRemote>(() => _i17.MoviesDetailRemote());
    gh.lazySingleton<_i18.MoviesDetailUsecase>(
        () => _i18.MoviesDetailUsecase());
    gh.lazySingleton<_i19.MoviesImagesUsecase>(
        () => _i19.MoviesImagesUsecase());
    gh.lazySingleton<_i20.MovieListRemote>(() => _i20.MovieListRemote());
    gh.lazySingleton<_i21.MovieListNowPlayingUsecase>(
        () => _i21.MovieListNowPlayingUsecase());
    gh.lazySingleton<_i22.MovieListPopularUsecase>(
        () => _i22.MovieListPopularUsecase());
    gh.lazySingleton<_i23.PeopleRemote>(() => _i23.PeopleRemote());
    gh.lazySingleton<_i24.PeopleUsecase>(() => _i24.PeopleUsecase());
    gh.lazySingleton<_i25.SearchRemote>(() => _i25.SearchRemote());
    gh.lazySingleton<_i26.SearchMultiUsecase>(() => _i26.SearchMultiUsecase());
    gh.lazySingleton<_i27.SearchPeopleUsecase>(
        () => _i27.SearchPeopleUsecase());
    gh.lazySingleton<_i28.MoviesDetailSimilarUsecase>(
        () => _i28.MoviesDetailSimilarUsecase());
    gh.lazySingleton<_i29.MoviesDetailRecommendUsecase>(
        () => _i29.MoviesDetailRecommendUsecase());
    gh.lazySingleton<_i30.MoviesDetailRepository>(
        () => _i31.MoviesDetailRepositoryImp());
    gh.lazySingleton<_i32.MovieListRemoteDatasource>(
        () => _i32.MovieListRemoteDatasourceImpl());
    gh.lazySingleton<_i33.MoviesDetailRemoteDatasource>(
        () => _i33.MoviesDetailRemoteDatasourceImpl());
    gh.lazySingleton<_i34.CollectionRepository>(
        () => _i35.CollectionRepositoryImp());
    gh.lazySingleton<_i36.MovieListRepository>(
        () => _i37.MovieListRepositoryImp());
    gh.lazySingleton<_i38.DiscoveryMoviesRemoteDatasource>(
        () => _i38.DiscoveryMoviesRemoteDatasourceImp());
    gh.lazySingleton<_i39.SearchRemoteDatasource>(
        () => _i39.SearchRemoteDatasourceImpl());
    gh.lazySingleton<_i40.DiscoveryRepository>(
        () => _i41.DiscoveryRepositoryImp());
    gh.lazySingleton<_i42.CollectionRemoteDatasource>(
        () => _i42.CollectionRemoteDatasourceImp());
    gh.lazySingleton<_i43.PeopleRemoteDatasource>(
        () => _i43.PeopleRemoteDatasourceImpl());
    gh.lazySingleton<_i44.PeopleRepository>(() => _i45.PeopleRepositoryImpl());
    gh.lazySingleton<_i46.SearchRepository>(() => _i47.SearchRepositoryImpl());
    return this;
  }
}
