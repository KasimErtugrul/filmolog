part of 'discovery_bloc.dart';

class DiscoveryState extends Equatable {
  final List<FutureMoviesResultEntity> futureFutureMoviesList;
  final List<FutureMoviesResultEntity> nowPlayingMoviesList;
  final List<FutureTVDiscoveryResultEntity> futureTvDiscoveryList;
  final List<DiscoveryCastResultEntity> discoveryCastResultList;

  final bool futureMoviesLoaded;
  final bool nowPlayingMoviesLoaded;
  final bool futureTVDiscoveryLoaded;
  final bool discoveryWithCastLoaded;
  const DiscoveryState({
    this.futureFutureMoviesList = const [],
    this.nowPlayingMoviesList = const [],
    this.futureTvDiscoveryList = const [],
    this.futureMoviesLoaded = false,
    this.nowPlayingMoviesLoaded = false,
    this.futureTVDiscoveryLoaded = false,
    this.discoveryCastResultList = const [],
    this.discoveryWithCastLoaded = false,
  });

  DiscoveryState copyWith({
    List<FutureMoviesResultEntity>? futureFutureMoviesList,
    List<FutureMoviesResultEntity>? nowPlayingMoviesList,
    List<FutureTVDiscoveryResultEntity>? futureTvDiscoveryList,
    bool? futureMoviesLoaded,
    bool? nowPlayingMoviesLoaded,
    bool? futureTVDiscoveryLoaded,
    List<DiscoveryCastResultEntity>? discoveryCastResultList,
    bool? discoveryWithCastLoaded,
  }) {
    return DiscoveryState(
      futureFutureMoviesList:
          futureFutureMoviesList ?? this.futureFutureMoviesList,
      nowPlayingMoviesList: nowPlayingMoviesList ?? this.nowPlayingMoviesList,
      futureTvDiscoveryList:
          futureTvDiscoveryList ?? this.futureTvDiscoveryList,
      futureMoviesLoaded: futureMoviesLoaded ?? this.futureMoviesLoaded,
      nowPlayingMoviesLoaded:
          nowPlayingMoviesLoaded ?? this.nowPlayingMoviesLoaded,
      futureTVDiscoveryLoaded:
          futureTVDiscoveryLoaded ?? this.futureTVDiscoveryLoaded,
      discoveryCastResultList:
          discoveryCastResultList ?? this.discoveryCastResultList,
      discoveryWithCastLoaded:
          discoveryWithCastLoaded ?? this.discoveryWithCastLoaded,
    );
  }

  @override
  List<Object> get props {
    return [
      futureFutureMoviesList,
      nowPlayingMoviesList,
      futureTvDiscoveryList,
      futureMoviesLoaded,
      nowPlayingMoviesLoaded,
      futureTVDiscoveryLoaded,
      discoveryCastResultList,
      discoveryWithCastLoaded,
    ];
  }

  @override
  String toString() {
    return 'DiscoveryState{futureFutureMoviesList=$futureFutureMoviesList, nowPlayingMoviesList=$nowPlayingMoviesList, futureTvDiscoveryList=$futureTvDiscoveryList, discoveryCastResultList=$discoveryCastResultList, futureMoviesLoaded=$futureMoviesLoaded, nowPlayingMoviesLoaded=$nowPlayingMoviesLoaded, futureTVDiscoveryLoaded=$futureTVDiscoveryLoaded, discoveryWithCastLoaded=$discoveryWithCastLoaded}';
  }
}
