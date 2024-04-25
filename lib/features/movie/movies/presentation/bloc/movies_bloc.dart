import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:filmolog/features/movie/movies/domain/entities/movies_detail_sim_reco_entity.dart';
import 'package:filmolog/features/movie/movies/domain/usecases/movies_detail_similar_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import '../../domain/domain.dart';
import '../../domain/usecases/movie_detail_recommend_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

@Injectable()
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesDetailUsecase moviesDetailUsecase = getIt();
  final MoviesImagesUsecase moviesImagesUsecase = getIt();

  final MoviesDetailSimilarUsecase moviesSimilarUsecase = getIt();
  final MoviesDetailRecommendUsecase moviesRecommendUsecase = getIt();
  MoviesBloc() : super(const MoviesState()) {
    on<FetchMovieDetail>((event, emit) async {
      var result = await moviesDetailUsecase.call(event.movieId);
      result.fold(
        (l) {
          emit(state.copyWith(moviesDetailLoaded: false));
        },
        (r) {
          emit(state.copyWith(moviesDetailData: r, moviesDetailLoaded: true));
        },
      );
    });

    on<FetchMovieImages>((event, emit) async {
      var result = await moviesImagesUsecase.call(event.movieId);
      result.fold(
        (l) {
          emit(state.copyWith(moviesImagesLoaded: false));
        },
        (r) {
          emit(state.copyWith(moviesImagesData: r, moviesImagesLoaded: true));
        },
      );
    });

    on<FetchMovieSimilar>((event, emit) async {
      var result = await moviesSimilarUsecase.call(event.movieId, event.page);
      result.fold(
        (l) {
          emit(state.copyWith(moviesSimilarLoaded: false));
        },
        (r) {
          List<MovieSimRecoResultEntity> updatedList;

          if (event.page != 1) {
            updatedList = List.of(state.moviesSimilarData)..addAll(r.results!);
            emit(state.copyWith(
                moviesSimilarData: updatedList, moviesSimilarLoaded: true));
            log('similar bloc if ${updatedList.length}');
          } else {
            updatedList = r.results!;
            emit(state.copyWith(
                moviesSimilarData: updatedList, moviesSimilarLoaded: true));
            log('similar bloc ${updatedList.length}');
          }
        },
      );
    });

    on<FetchMovieRecomend>((event, emit) async {
      var result = await moviesRecommendUsecase.call(event.movieId, event.page);
      result.fold(
        (l) {
          emit(state.copyWith(moviesRecommendLoaded: false));
        },
        (r) {
          List<MovieSimRecoResultEntity> updatedList;

          if (event.page != 1) {
            updatedList = List.of(state.moviesRecommendData)
              ..addAll(r.results!);
            emit(state.copyWith(
                moviesRecommendData: updatedList, moviesRecommendLoaded: true));
            log('reco bloc if ${updatedList.length}');
          } else {
            updatedList = r.results!;
            emit(state.copyWith(
                moviesRecommendData: updatedList, moviesRecommendLoaded: true));
            log('reco bloc ${updatedList.length}');
          }
        },
      );
    });
  }
}
