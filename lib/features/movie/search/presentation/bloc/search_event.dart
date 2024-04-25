part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class FetchSearchPeople extends SearchEvent {
  final String query;

  const FetchSearchPeople(this.query);

  @override
  List<Object> get props => [query];
}

class FetchSearchMulti extends SearchEvent {
  final String query;

  const FetchSearchMulti(this.query);

  @override
  List<Object> get props => [query];
}
