import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmolog/core/api/api_settings.dart';
import 'package:filmolog/features/movie/people/presentation/widget/people_widget.dart';
import 'package:filmolog/features/movie/search/presentation/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class SearchPageResultPerson extends StatelessWidget {
  const SearchPageResultPerson({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.searchMultiListData[2].length,
                itemBuilder: (context, index) {
                  var result = state.searchMultiListData[2][index];
                  return GestureDetector(
                    child: SizedBox(
                      height: 100.h,
                      child: Card(
                        color: const Color.fromARGB(255, 35, 35, 34),
                        child: Row(
                          children: [
                            result.profilePath != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      imageUrl: ApiSettings.imagePath500(
                                        result.profilePath!,
                                      ),
                                      width: 70.h,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      'assets/images/no_person.png',
                                      width: 70.h,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            const Gap(5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(result.name!),
                                SizedBox(
                                  height: 65.h,
                                  width: 200.h,
                                  child: Row(
                                    children: result.knownFor!
                                        .map((e) => e.posterPath != null
                                            ? CachedNetworkImage(
                                                imageUrl:
                                                    ApiSettings.imagePath185(
                                                        e.posterPath!))
                                            : const SizedBox())
                                        .toList(),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: PeopleWidget(
                            peopleId: state.searchMultiListData[2][index].id!,
                          ));
                    },
                  );
                },
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
