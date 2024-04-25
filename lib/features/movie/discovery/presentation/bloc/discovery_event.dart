part of 'discovery_bloc.dart';

abstract class DiscoveryEvent extends Equatable {
  const DiscoveryEvent();

  @override
  List<Object> get props => [];
}

class FetchDiscoveryFutureMovies extends DiscoveryEvent {
  final int? page;

  const FetchDiscoveryFutureMovies({this.page = 1});
  @override
  List<Object> get props => [page!];
}

class FetchDiscoveryNowPlayingMovies extends DiscoveryEvent {
  final int? page;

  const FetchDiscoveryNowPlayingMovies({this.page = 1});
  @override
  List<Object> get props => [page!];
}

class FetchFutureDiscoveryTV extends DiscoveryEvent {
  final int? page;

  const FetchFutureDiscoveryTV({this.page = 1});
  @override
  List<Object> get props => [page!];
}

class FetchDiscoveryWithCastEvent extends DiscoveryEvent {
  final String peopleId1;
  final String peopleId2;
  const FetchDiscoveryWithCastEvent(
      {required this.peopleId1, required this.peopleId2});

  @override
  List<Object> get props => [peopleId1, peopleId2];
}
