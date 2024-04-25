import 'package:filmolog/features/movie/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main.dart';
import 'features/features.dart';


class AppProviders extends StatelessWidget {
  const AppProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieListBloc()
            ..add(const FetchMovieListPopular())
            ..add(const FetchMovieListNowPlaying()),
        ),
        BlocProvider(
            create: (context) => DiscoveryBloc()
              ..add(const FetchDiscoveryFutureMovies())
              ..add(const FetchDiscoveryNowPlayingMovies())
              ..add(const FetchFutureDiscoveryTV())),
        BlocProvider(
          create: (context) => CollectionBloc(),
        ),
         BlocProvider(
          create: (context) => SearchBloc(),
        ),
       
        BlocProvider(
          create: (context) => CastCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}
