part of 'people_bloc.dart';

sealed class PeopleEvent extends Equatable {
  const PeopleEvent();

  @override
  List<Object> get props => [];
}

class FetchPeople extends PeopleEvent {
  final int peopleId;

  const FetchPeople(this.peopleId);

  @override
  List<Object> get props => [peopleId];
}
