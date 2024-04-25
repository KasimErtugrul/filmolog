import 'package:filmolog/features/movie/movies/presentation/bloc/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movies_about_tab_widget.dart';

class MovieDetailAbouth extends StatelessWidget {
  const MovieDetailAbouth({super.key});

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
                  padding: const EdgeInsets.only(left: 8.0),
                  sliver: SliverList.list(
                    children: const [
                      MoviesDetailAboutWidget(),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
      },
    );
  }
}
