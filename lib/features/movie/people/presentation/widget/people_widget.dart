import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:filmolog/core/api/api.dart';
import 'package:filmolog/features/movie/people/presentation/widget/discovery_tab/discovery_widget.dart';
import 'package:filmolog/features/movie/people/presentation/widget/movie_cast_tab/people_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../people.dart';

class PeopleWidget extends StatelessWidget {
  final int peopleId;
  const PeopleWidget({super.key, required this.peopleId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PeopleBloc()..add(FetchPeople(peopleId)),
      child: BlocBuilder<PeopleBloc, PeopleState>(
        builder: (context, state) {
          return Scaffold(
            body: ConditionalBuilder(
              condition: state.peopleLoaded,
              builder: (context) {
                return SafeArea(
                  child: DefaultTabController(
                    length: 3,
                    child: NestedScrollView(
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        var result = state.peopleData!;
                        return <Widget>[
                          SliverAppBar(
                            leading: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.amber,
                                )),
                            expandedHeight: 300.0.h,
                            floating: false,
                            pinned: false,
                            flexibleSpace: FlexibleSpaceBar(
                                background: TamamenDeneme(result: result)),
                          ),
                          SliverPersistentHeader(
                            delegate: _SliverAppBarDelegate(
                              TabBar(
                                tabs: [
                                  Tab(
                                    child: Text(
                                      'Biyografi',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Filmoloji',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Keşfet',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pinned: true,
                          ),
                        ];
                      },
                      body: TabBarView(
                        children: [
                          const PeopleBiographTabWidget(),
                          const PeopleMovies(),
                          DiscoveryWidget(
                            peopleId1: peopleId.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              fallback: (context) => Center(
                child: LoadingAnimationWidget.halfTriangleDot(
                  color: Colors.yellow,
                  size: 50.h,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TamamenDeneme extends StatelessWidget {
  const TamamenDeneme({
    super.key,
    required this.result,
  });

  final PeopleEntity result;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleBloc, PeopleState>(
      builder: (context, state) {
        return Builder(builder: (context) {
          log('people flexible');
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    maxRadius: 100.h,
                    backgroundColor: Colors.white,
                    foregroundImage: state.peopleData!.profilePath != null
                        ? CachedNetworkImageProvider(
                            ApiSettings.imagePath500(
                                state.peopleData!.profilePath!),
                          )
                        : const AssetImage(
                            'assets/images/no_person.png',
                          ) as ImageProvider,
                  ),
                  Text(result.name!,
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(result.knownForDepartment!,
                      style: Theme.of(context).textTheme.bodySmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      result.birthday != null
                          ? Text(
                              ApiSettings.formatMonthAndYear(result.birthday!),
                              style: Theme.of(context).textTheme.bodySmall)
                          : const Text(''),
                      Text(' - ', style: Theme.of(context).textTheme.bodySmall),
                      result.deathday != null
                          ? Text(
                              ApiSettings.formatMonthAndYear(result.deathday!),
                              style: Theme.of(context).textTheme.bodySmall)
                          : const Text('')
                    ],
                  ),
                  Text(result.placeOfBirth ?? '',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          );
        });
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
