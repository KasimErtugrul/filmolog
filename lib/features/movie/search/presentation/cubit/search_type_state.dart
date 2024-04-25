part of 'search_type_cubit.dart';

 class SearchTypeState extends Equatable {
  final SearchType searchType;

    const SearchTypeState({
     this.searchType=SearchType.NOSELECT
  });


  @override
  List<Object> get props => [searchType];

  SearchTypeState copyWith({
    SearchType? searchType    
  }) {
    return SearchTypeState(
          searchType: searchType ?? this.searchType
    );
  }
}


