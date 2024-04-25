import 'package:filmolog/features/movie/movies/presentation/pages/movies_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../app/util/app_settings.dart';
import '../../../../../../app/widgets/base_poster.dart';
import '../../bloc/movies_bloc.dart';

class MovieDetailRecommandation extends StatefulWidget {
  final int movieId;
  const MovieDetailRecommandation({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailRecommandation> createState() =>
      _MovieDetailRecommandationState();
}

class _MovieDetailRecommandationState extends State<MovieDetailRecommandation> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return SafeArea(child: Builder(
          builder: (context) {
            return CustomScrollView(
              // controller: scrollController,
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                    padding: const EdgeInsets.all(8),
                    sliver: SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: state.moviesRecommendData.length,
                      itemBuilder: (context, index) {
                        var result = state.moviesRecommendData[index];
                        return GestureDetector(
                          child: BasePoster(
                            posterPath: result.posterPath,
                            voteAverage: AppSettings.voteAverageString(
                                result.voteAverage!),
                            releaseDate: result.releaseDate,
                            title: result.title,
                          ),
                          onTap: () => PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: MoviesDetailPage(
                              moviesId: result.id!,
                              posterName: result.posterPath,
                            ),
                          ),
                        );
                      },
                    )),
              ],
            );
          },
        ));
      },
    );
  }
}
