import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:filmolog/di.dart';
import 'package:filmolog/features/movie/search/domain/entities/search_multi_entity.dart';
import 'package:filmolog/features/movie/search/domain/entities/search_people_entity.dart';
import 'package:filmolog/features/movie/search/domain/usecases/search_multi_usecase.dart';
import 'package:filmolog/features/movie/search/domain/usecases/search_people_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'search_event.dart';
part 'search_state.dart';

@Injectable()
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchPeopleUsecase searchPeopleUsecase =
      getIt.get<SearchPeopleUsecase>();
  final SearchMultiUsecase searchMultiUsecase = getIt.get<SearchMultiUsecase>();
  SearchBloc() : super(const SearchState()) {
    on<FetchSearchPeople>((event, emit) async {
      var result = await searchPeopleUsecase(event.query);

      try {
        result.fold((l) {
          emit(state.copyWith(searchPeopleLoaded: false));
        }, (r) {
          emit(state.copyWith(searchPeopleEntity: r, searchPeopleLoaded: true));
        });
      } catch (e) {
        log(e.toString());
      }
    });

    on<FetchSearchMulti>((event, emit) async {
      try {
        var result = await searchMultiUsecase(event.query);
        result.fold((l) {
          emit(state.copyWith(searchMultiLoaded: false));
        }, (r) {
          emit(state.copyWith(searchMultiListData: r, searchMultiLoaded: true));
        });
      } catch (e) {
        log(e.toString());
      }
    });
  }
}
