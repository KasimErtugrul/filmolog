import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import '../../domain/domain.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';
@Injectable()
class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  final MovieListPopularUsecase movieListPopularUsecase = getIt.get<MovieListPopularUsecase>();
  final MovieListNowPlayingUsecase movieListNowPlayingUsecase = getIt.get<MovieListNowPlayingUsecase>();

  MovieListBloc() : super(const MovieListState()) {
    on<FetchMovieListPopular>((event, emit) async {
      final result = await movieListPopularUsecase.call(event.page!);
      result.fold((l) {
        emit(state.copyWith(popularListLoaded: false));
      }, (r) {
        List<MovieListResultEntity> updatedList;
        if (event.page != 1) {
          updatedList = List.of(state.movieListPopularList)..addAll(r.results!);
        } else {
          updatedList = r.results!;
        }
        emit(state.copyWith(
          movieListPopularList: updatedList, // Burada updatedList'i kullanın
          popularListLoaded: true,
        ));
      });
    });

    on<FetchMovieListNowPlaying>((event, emit) async {
      final result = await movieListNowPlayingUsecase.call(event.page!);
      result.fold((l) {
        emit(state.copyWith(nowPlayingListLoaded: false));
      }, (r) {
        List<MovieListResultEntity> updatedList;
        if (event.page != 1) {
          updatedList = List.of(state.movieListNowPlayingList)
            ..addAll(r.results!);
        } else {
          updatedList = r.results!;
        }
        emit(state.copyWith(
          movieListNowPlayingList: updatedList, // Burada updatedList'i kullanın
          nowPlayingListLoaded: true,
        ));
      });
    });
  }
}
