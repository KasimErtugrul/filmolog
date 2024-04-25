import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../features/movie/discovery/presentation/widgets/future_movie_list_widget.dart';
import '../../features/movie/discovery/presentation/widgets/nowplaying_discovery_movie_list_widget.dart';
import '../../features/movie/movie.dart';
import '../../features/movie/movie_list/presentation/widgets/nowplaying_movie_list_widget.dart';
import '../../features/movie/movie_list/presentation/widgets/popular_movie_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListBloc, MovieListState>(
      builder: (context, stateMovies) {
        return BlocBuilder<DiscoveryBloc, DiscoveryState>(
          builder: (context, stateDiscovery) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('filmolog'),
              ),
              body: ConditionalBuilder(
                condition: stateMovies.nowPlayingListLoaded &&
                    stateMovies.popularListLoaded &&
                    stateDiscovery.futureMoviesLoaded &&
                    stateDiscovery.nowPlayingMoviesLoaded,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      const PopularMovieListWidget(),
                      Gap(5.h),
                      const NowPlayingMovieListWidget(),
                      Gap(5.h),
                      const FutureMovieListWidget(),
                      Gap(5.h),
                      const NowplayingDiscoveryMovieListWidget(),
                    ],
                  ),
                ),
                fallback: (context) => Center(
                  child: LoadingAnimationWidget.halfTriangleDot(
                    color: Colors.yellow,
                    size: 50.h,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
