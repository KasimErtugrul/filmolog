import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../movies.dart';

class MoviesDetailAboutOverviewWidget extends StatelessWidget {
  const MoviesDetailAboutOverviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state.moviesDetailData != null &&
              state.moviesDetailData!.overview!.isNotEmpty,
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Özet',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                state.moviesDetailData!.overview!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const Divider()
            ],
          ),
          fallback: (context) => const SizedBox(),
        );
      },
    );
  }
}
