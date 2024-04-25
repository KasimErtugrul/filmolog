import 'dart:developer';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:filmolog/features/features.dart';
import 'package:filmolog/features/movie/movie.dart';
import 'package:filmolog/features/movie/movies/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../movies.dart';
import '../widgets/abouth_tab/movie_detail_about.dart';
import '../widgets/cast_and_crew_tab/movie_detail_cast_crew.dart';
import '../widgets/media_tab/movie_detail_media.dart';
import '../widgets/recommendatiton_tab/movie_detail_reco.dart';
import '../widgets/similar_tab/movie_detail_similar.dart';

class MoviesDetailPage extends StatelessWidget {
  final int moviesId;
  final String? posterName;
  const MoviesDetailPage({super.key, required this.moviesId, this.posterName});

  @override
  Widget build(BuildContext context) {
    log(moviesId.toString());
    final List<String> tabs = <String>[
      'Hakkında',
      'Medya',
      'Ekip',
      'Yorum',
      'Size Özel',
      'Benzer'
    ];
    return BlocProvider(
      create: (context) => MoviesBloc()
        ..add(FetchMovieDetail(moviesId))
        ..add(FetchMovieRecomend(movieId: moviesId))
        ..add(FetchMovieImages(moviesId))
        ..add(FetchMovieSimilar(movieId: moviesId)),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return DefaultTabController(
            length: tabs.length,
            child: Scaffold(
              body: ConditionalBuilder(
                condition: state.moviesDetailLoaded &&
                    // state.moviesImagesLoaded &&
                    state.moviesRecommendLoaded &&
                    state.moviesSimilarLoaded,
                builder: (context) => NestedScrollView(
                    headerSliverBuilder: (context, innerBoxIsScrolled) {
                      return <Widget>[
                        SliverOverlapAbsorber(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                          sliver: SliverAppBar(
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.blue,
                                )),
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.popUntil(
                                      context,
                                      (route) => route.isFirst,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.home,
                                    color: Colors.blue,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share_outlined,
                                    color: Colors.blue,
                                  ))
                            ],
                            pinned: true,
                            expandedHeight: 300.h,
                            forceElevated: innerBoxIsScrolled,
                            flexibleSpace: FlexibleSpaceBar(
                              background: MovieDetailStackWidget(
                                posterPath: posterName!,
                              ),
                            ),
                            bottom: TabBar(
                                labelColor:
                                    const Color.fromARGB(221, 164, 132, 250),
                                unselectedLabelColor:
                                    const Color.fromARGB(255, 250, 250, 250)
                                        .withOpacity(.3),
                                indicatorColor:
                                    const Color.fromARGB(255, 59, 98, 255),
                                isScrollable: true,
                                tabs: tabs
                                    .map((String name) => Tab(
                                          text: name,
                                        ))
                                    .toList()),
                          ),
                        ),
                      ];
                    },
                    body: TabBarView(children: [
                      // Hakkında Tab
                      const MovieDetailAbouth(),
                      // Medya Tab
                      const MovieDetailMedia(),
                      // Ekip Tab
                      const MovieDetailCasts(),
                      // Yorum Tab
                     const Center(child: Text('Yorum Page'),),
                      // Size Özel Tab
                      MovieDetailRecommandation(
                        movieId: moviesId,
                      ),
                      // Benzer Tab
                      MovieDetailSimilar(
                        movieId: moviesId,
                      ),
                    ])),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}







