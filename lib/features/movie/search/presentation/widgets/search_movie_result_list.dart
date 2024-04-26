import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../app/app.dart';
import '../../../movies/presentation/pages/movies_detail_page.dart';
import '../bloc/search_bloc.dart';

class SearchPageResultMovieWidget extends StatelessWidget {
  const SearchPageResultMovieWidget({
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
              SizedBox(
                height: 180.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.searchMultiListData[0].length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: BasePoster(
                        posterPath:
                            state.searchMultiListData[0][index].posterPath,
                        releaseDate:
                            state.searchMultiListData[0][index].releaseDate,
                        title: state.searchMultiListData[0][index].title,
                        voteAverage: AppSettings.voteAverageString(
                          state.searchMultiListData[0][index].voteAverage!,
                        ),
                      ),
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: MoviesDetailPage(
                              moviesId: state.searchMultiListData[0][index].id!,
                              posterName: state
                                  .searchMultiListData[0][index].posterPath,
                            ));
                      },
                    );
                  },
                ),
              ),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
