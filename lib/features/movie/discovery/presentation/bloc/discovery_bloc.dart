import 'package:equatable/equatable.dart';
import 'package:filmolog/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../di.dart';
import '../../domain/domain.dart';

part 'discovery_event.dart';
part 'discovery_state.dart';

@Injectable()
class DiscoveryBloc extends Bloc<DiscoveryEvent, DiscoveryState> {
  final FutureMoviesUseacase futureMoviesUseacase =
      getIt.get<FutureMoviesUseacase>();
  final NowPlayingTRMoviesUseacase nowPlayingTRMoviesUseacase =
      getIt.get<NowPlayingTRMoviesUseacase>();
  final FutureTVDiscoveryUsecase futureTVDiscoveryUsecase = getIt();
  final DiscoveryWithCastUsecase discoveryWithCastUsecase =
      getIt.get<DiscoveryWithCastUsecase>();

  DiscoveryBloc() : super(const DiscoveryState()) {
    on<FetchDiscoveryFutureMovies>((event, emit) async {
     
      var result = await futureMoviesUseacase.call(event.page!);

      result.fold(
        (l) {
          emit(state.copyWith(futureMoviesLoaded: false));
        },
        (r) {
          List<FutureMoviesResultEntity> newList =
              List.from(state.futureFutureMoviesList);
          newList.addAll(r.results!);
          emit(state.copyWith(
              futureFutureMoviesList: newList, futureMoviesLoaded: true));
        },
      );
    });

    on<FetchDiscoveryNowPlayingMovies>((event, emit) async {
      var result = await nowPlayingTRMoviesUseacase.call(event.page!);
      result.fold((l) {
        emit(state.copyWith(nowPlayingMoviesLoaded: false));
      }, (r) {
        List<FutureMoviesResultEntity> newList =
            List.from(state.nowPlayingMoviesList);
        newList.addAll(r.results!);
        emit(state.copyWith(
            nowPlayingMoviesList: newList, nowPlayingMoviesLoaded: true));
      });
    });

    on<FetchFutureDiscoveryTV>((event, emit) async {
      var result = await futureTVDiscoveryUsecase.call(event.page!);
      result.fold((l) {
        emit(state.copyWith(futureTVDiscoveryLoaded: false));
      }, (r) {
        List<FutureTVDiscoveryResultEntity> newList =
            List.from(state.futureTvDiscoveryList);
        newList.addAll(r.results!);
        emit(state.copyWith(
            futureTvDiscoveryList: newList, futureTVDiscoveryLoaded: true));
      });
    });

    on<FetchDiscoveryWithCastEvent>((event, emit) async {
      DiscoveryWithCastModelUsecase model = DiscoveryWithCastModelUsecase(
          peopleId1: event.peopleId1, peopleId2: event.peopleId2);
      var result = await discoveryWithCastUsecase.call(model);
      result.fold((l) {
        emit(state.copyWith(discoveryWithCastLoaded: false));
      }, (r) {
        emit(state.copyWith(
            discoveryCastResultList: r.results, discoveryWithCastLoaded: true));
      });
    });
  }
}
