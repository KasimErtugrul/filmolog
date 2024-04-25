import 'package:filmolog/features/movie/movies/presentation/bloc/movies_bloc.dart';
import 'package:filmolog/features/movie/movies/presentation/widgets/media_tab/movies_detail_videos_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movies_detai_images_backdrop_widget.dart';
import 'movies_detail_images_poster_widget.dart';

class MovieDetailMedia extends StatelessWidget {
  const MovieDetailMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return SafeArea(child: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverPadding(
                    padding: const EdgeInsets.all(8),
                    sliver: SliverList.list(children: const [
                      MoviesDetailImagesPosterWidget(),
                      MoviesDetailImagesBackdropWidget(),
                      MoviesDetailVideosWidget(),
                    ])),
              ],
            );
          },
        ));
      },
    );
  }
}
