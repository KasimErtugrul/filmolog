part of 'people_bloc.dart';

class PeopleState extends Equatable {
  final PeopleEntity? peopleData;
  final bool peopleLoaded;
  const PeopleState({
    this.peopleData,
    this.peopleLoaded = false,
  });

  @override
  List<Object> get props => [];

  PeopleState copyWith({
    PeopleEntity? peopleData,
    bool? peopleLoaded,
  }) {
    return PeopleState(
      peopleData: peopleData ?? this.peopleData,
      peopleLoaded: peopleLoaded ?? this.peopleLoaded,
    );
  }
}
