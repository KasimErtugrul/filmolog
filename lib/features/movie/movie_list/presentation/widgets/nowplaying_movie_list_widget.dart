import 'package:filmolog/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../app/app.dart';
import '../../../movie.dart';

class NowPlayingMovieListWidget extends StatefulWidget {
  const NowPlayingMovieListWidget({super.key});

  @override
  State<NowPlayingMovieListWidget> createState() =>
      _NowPlayingMovieListWidgetState();
}

class _NowPlayingMovieListWidgetState extends State<NowPlayingMovieListWidget> {
  ScrollController scrollController = ScrollController();
  int currentPage = 1;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        currentPage++;
        context
            .read<MovieListBloc>()
            .add(FetchMovieListNowPlaying(page: currentPage));
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieListBloc, MovieListState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gösterimdeki Filmler',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.double_arrow_rounded,
                    color: Colors.blue,
                    size: 20.h,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Text(
              'Popüler filmleri sizler için derledik',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Container(
              padding: EdgeInsets.only(top: 5.h),
              height: 170.h,
              child: ListView.builder(
                controller: scrollController,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.movieListNowPlayingList.length,
                itemBuilder: (context, index) {
                  var result = state.movieListNowPlayingList;
                  return GestureDetector(
                    child: BasePoster(
                      posterPath: result[index].posterPath,
                      releaseDate: result[index].releaseDate,
                      title: result[index].title,
                      voteAverage: AppSettings.voteAverageString(
                          result[index].voteAverage!),
                    ),
                    onTap: () {
                     PersistentNavBarNavigator.pushNewScreen(context,
                          screen: MoviesDetailPage(
                            moviesId: result[index].id!,
                            posterName: result[index].posterPath,
                          ));
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}