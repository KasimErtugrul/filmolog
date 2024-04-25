import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../../../../app/app.dart';
import '../../../../collection/collection.dart';
import '../../pages/movies_detail_page.dart';

class MoviesDetailCollectionWiget extends StatelessWidget {
  const MoviesDetailCollectionWiget({super.key, required this.collectionId});

  final int collectionId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CollectionBloc()..add(FetchCollection(collectionId: collectionId)),
      child: BlocConsumer<CollectionBloc, CollectionState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: state.moviesCollectionLoaded,
            builder: (context) => SizedBox(
                height: 200.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Filmin Serisi',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Expanded(
                        child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.collectionData.length,
                      itemBuilder: (context, index) {
                        var collectionList = state.collectionData[index];
                        return GestureDetector(
                          child: BasePoster(
                            posterPath: collectionList.posterPath,
                            title: collectionList.title!,
                            releaseDate: collectionList.releaseDate,
                            voteAverage: AppSettings.voteAverageString(
                                collectionList.voteAverage!),
                          ),
                          onTap: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: MoviesDetailPage(
                                  moviesId: collectionList.id!,
                                  posterName: collectionList.posterPath,
                                ));
                          },
                        );
                      },
                    )),
                    const Divider(),
                  ],
                )),
            fallback: (context) => const SizedBox(),
          );
        },
      ),
    );
  }
}
