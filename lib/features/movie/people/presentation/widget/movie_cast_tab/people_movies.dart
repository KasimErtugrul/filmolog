import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:filmolog/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../movies/presentation/pages/movies_detail_page.dart';
import '../../../people.dart';

class PeopleMovies extends StatelessWidget {
  const PeopleMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleBloc, PeopleState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConditionalBuilder(
                  condition: state.peopleData!.movieCredits!.cast!.isNotEmpty,
                  builder: (context) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Film Oyunculuğu (${state.peopleData!.movieCredits!.cast!.length})'),
                      SizedBox(
                        height: 160.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              state.peopleData!.movieCredits!.cast!.length,
                          itemBuilder: (context, index) {
                            var result =
                                state.peopleData!.movieCredits!.cast![index];

                            return GestureDetector(
                              child: BasePoster(
                                posterPath: result.posterPath,
                                releaseDate: result.releaseDate,
                                title: result.title,
                                voteAverage: AppSettings.voteAverageString(
                                    result.voteAverage ?? 1.0),
                              ),
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: MoviesDetailPage(
                                      moviesId: result.id!,
                                      posterName: result.posterPath,
                                    ));
                              },
                            );
                          },
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                  fallback: (context) => const SizedBox(),
                ),
                Gap(10.h),
                ConditionalBuilder(
                  condition: state.peopleData!.movieCredits!.crew!.isNotEmpty,
                  builder: (context) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Film Yapımcılığı (${state.peopleData!.movieCredits!.crew!.length})'),
                      SizedBox(
                        height: 160.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              state.peopleData!.movieCredits!.crew!.length,
                          itemBuilder: (context, index) {
                            var result =
                                state.peopleData!.movieCredits!.crew![index];

                            return GestureDetector(
                              child: BasePoster(
                                posterPath: result.posterPath,
                                releaseDate: result.releaseDate,
                                title: result.title,
                                voteAverage: AppSettings.voteAverageString(
                                    result.voteAverage!),
                              ),
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: MoviesDetailPage(
                                      moviesId: result.id!,
                                      posterName: result.posterPath,
                                    ));
                              },
                            );
                          },
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                  fallback: (context) => const SizedBox(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

/*

*/