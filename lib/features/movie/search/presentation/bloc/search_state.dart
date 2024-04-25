part of 'search_bloc.dart';
//List<List<SearchMultiResultEntity>>
class SearchState extends Equatable {
  final SearchPeopleEntity? searchPeopleEntity;
  final bool searchPeopleLoaded;
  final List<List<SearchMultiResultEntity>> searchMultiListData;
  final bool searchMultiLoaded;

  const SearchState({
    this.searchPeopleLoaded = false,
    this.searchPeopleEntity,
    this.searchMultiLoaded = false,
    this.searchMultiListData = const [],
  });

  @override
  List<Object?> get props => [
        searchPeopleEntity,
        searchPeopleLoaded,
        searchMultiListData,
        searchMultiLoaded,
      ];

  SearchState copyWith({
    SearchPeopleEntity? searchPeopleEntity,
    bool? searchPeopleLoaded,
    List<List<SearchMultiResultEntity>>? searchMultiListData,
    bool? searchMultiLoaded,
  }) {
    return SearchState(
      searchPeopleEntity: searchPeopleEntity ?? this.searchPeopleEntity,
      searchPeopleLoaded: searchPeopleLoaded ?? this.searchPeopleLoaded,
      searchMultiListData: searchMultiListData ?? this.searchMultiListData,
      searchMultiLoaded: searchMultiLoaded ?? this.searchMultiLoaded,
    );
  }
}
