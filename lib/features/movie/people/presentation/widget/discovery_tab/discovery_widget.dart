import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:filmolog/app/app.dart';
import 'package:filmolog/core/api/api.dart';
import 'package:filmolog/core/resources/resources.dart';
import 'package:filmolog/features/movie/movie.dart';
import 'package:filmolog/features/movie/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class DiscoveryWidget extends StatefulWidget {
  final String peopleId1;
  const DiscoveryWidget({super.key, required this.peopleId1});

  @override
  State<DiscoveryWidget> createState() => _DiscoveryWidgetState();
}

class _DiscoveryWidgetState extends State<DiscoveryWidget> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.clear();

    return SingleChildScrollView(
      child: Column(
        children: [
          const Text('Ekip Arkadaşı Ara'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.clear();
                      context
                          .read<SearchBloc>()
                          .add(FetchSearchPeople(controller.text));
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.blue,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onChanged: (query) {
                  context.read<SearchBloc>().add(FetchSearchPeople(query));
                },
              ),
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchPeopleLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.searchPeopleEntity!.results!.length,
                  itemBuilder: (context, index) {
                    var person = state.searchPeopleEntity!.results![index];
                    return Card(
                      color: ColorManager.cardColor,
                      child: ListTile(
                        leading: CircleAvatar(
                          foregroundImage: person.profilePath != null
                              ? CachedNetworkImageProvider(
                                  ApiSettings.imagePath185(person.profilePath!),
                                )
                              : const AssetImage('assets/images/no_person.png')
                                  as ImageProvider,
                        ),
                        title: Text(
                          person.name ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        subtitle: Text(
                          person.knownForDepartment ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        onTap: () {
                          context.read<DiscoveryBloc>().add(
                              FetchDiscoveryWithCastEvent(
                                  peopleId1: widget.peopleId1,
                                  peopleId2: state
                                      .searchPeopleEntity!.results![index].id!
                                      .toString()));
                          controller.clear();
                        },
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox(); // Sonuçlar yüklenene kadar boş bir container göster
              }
            },
          ),
          const Divider(),
          BlocBuilder<DiscoveryBloc, DiscoveryState>(
            builder: (context, stateDiscovery) {
              return ConditionalBuilder(
                condition: stateDiscovery.discoveryWithCastLoaded,
                builder: (context) {
                  return stateDiscovery.discoveryCastResultList.isNotEmpty
                      ? SizedBox(
                          height: 250.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                stateDiscovery.discoveryCastResultList.length,
                            itemBuilder: (context, index) {
                              var result =
                                  stateDiscovery.discoveryCastResultList[index];
                              return GestureDetector(
                                child: BasePoster(
                                  posterPath: result.posterPath,
                                  releaseDate: result.releaseDate,
                                  title: result.title,
                                  voteAverage: AppSettings.voteAverageString(
                                      result.voteAverage!),
                                ),
                                onTap: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: MoviesDetailPage(
                                        moviesId: result.id!,
                                        posterName: result.posterPath,
                                      ));
                                },
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Text(
                            'Herhangi Bir Sonuç Bulunamadı',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                },
                fallback: (context) => const SizedBox(),
              );
            },
          )
        ],
      ),
    );
  }
}
