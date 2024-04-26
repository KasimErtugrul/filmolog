
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movies.dart';

class MoviesDetailAboutWidget extends StatelessWidget {
  const MoviesDetailAboutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, moviesBuilder) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MoviesDetailAboutOverviewWidget(),
                ConditionalBuilder(
                  condition:
                      moviesBuilder.moviesDetailData!.belongsToCollection !=
                          null,
                  builder: (context) {
                    return MoviesDetailCollectionWiget(
                      collectionId: moviesBuilder
                          .moviesDetailData!.belongsToCollection!.id!,
                    );
                  },
                  fallback: (context) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
