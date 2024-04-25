import 'package:equatable/equatable.dart';
import 'package:filmolog/app/util/util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/app.dart';

part 'search_type_state.dart';

class SearchTypeCubit extends Cubit<SearchTypeState> {
  SearchTypeCubit() : super(const SearchTypeState());

   changeSearchType(SearchType searchType) {
    if (searchType == state.searchType) {
      return;
    }
    emit(state.copyWith(searchType: searchType));
  }
}
