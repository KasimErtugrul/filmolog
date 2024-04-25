import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:filmolog/features/movie/people/people.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../../app/app.dart';
import '../../../../../../core/core.dart';
import '../../../movies.dart';

class MoviesDetailAboutCastAndCrewWidget extends StatelessWidget {
  MoviesDetailAboutCastAndCrewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesBloc, MoviesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state.moviesDetailData != null,
          builder: (context) => Column(
            children: [
              _buildContent(context, state),
            ],
          ),
          fallback: (context) => const SizedBox(),
        );
      },
    );
  }

  final ScrollController castScroll = ScrollController();
  final ScrollController crewScroll = ScrollController();

  Widget _buildContent(BuildContext context, MoviesState state) {
    final castState = context.watch<CastCubit>().state;

    return Column(
      children: [
        const Gap(5),
        Row(
          children: [
            _buildTabButton(context, 'Oyuncular', CastEnum.cast),
            const Gap(5),
            _buildTabButton(context, 'Yapım Ekibi', CastEnum.crew),
          ],
        ),
        const Gap(10),
        castState.castEnum == CastEnum.cast
            ? _buildCastList(context, state)
            : _buildCrewList(context, state),
        const Divider(),
      ],
    );
  }

  Widget _buildTabButton(
      BuildContext context, String label, CastEnum castEnum) {
    final bool isSelected =
        context.watch<CastCubit>().state.castEnum == castEnum;

    return GestureDetector(
      onTap: () {
        context.read<CastCubit>().setCast(castEnum);
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: .2),
          color: isSelected
              ? const Color.fromARGB(255, 59, 58, 58)
              : Colors.transparent,
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  Widget _buildCastList(BuildContext context, MoviesState state) {
    final List<CastEntity> castList = state.moviesDetailData!.credits!.cast!;
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: castList.length,
        itemBuilder: (context, index) {
          final CastEntity cast = castList[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              child: Column(
                children: [
                  ConditionalBuilder(
                    condition: cast.profilePath != null,
                    builder: (context) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: ApiSettings.imagePath500(cast.profilePath!),
                        height: 125.h,
                      ),
                    ),
                    fallback: (context) => Image.asset(
                      'assets/images/no_person.png',
                      height: 125.h,
                    ),
                  ),
                  SizedBox(
                    width: 100.h,
                    child: Text(
                      cast.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(
                    width: 100.h,
                    child: Text(
                      cast.character ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.red),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: PeopleWidget(
                    peopleId: cast.id!,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildCrewList(BuildContext context, MoviesState state) {
    final List<CrewEntity> crewList = state.moviesDetailData!.credits!.crew!;
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: crewList.length,
        itemBuilder: (context, index) {
          final CrewEntity crew = crewList[index];
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              child: Column(
                children: [
                  ConditionalBuilder(
                    condition: crew.profilePath != null,
                    builder: (context) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: ApiSettings.imagePath500(crew.profilePath!),
                        height: 125.h,
                      ),
                    ),
                    fallback: (context) => Image.asset(
                      'assets/images/no_person.png',
                      height: 125.h,
                    ),
                  ),
                  SizedBox(
                    width: 100.h,
                    child: Text(
                      crew.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(
                    width: 100.h,
                    child: FutureBuilder<String?>(
                      future: AppSettings.getJobTranslation(
                        crew.department!,
                        crew.job!,
                      ),
                      builder: (BuildContext context,
                          AsyncSnapshot<String?> snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const SizedBox.shrink();
                        }
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data!,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.red),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          );
                        }
                        return const Text('Veri bulunamadı.');
                      },
                    ),
                  ),
                ],
              ),
              onTap: () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: PeopleWidget(
                    peopleId: crew.id!,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
