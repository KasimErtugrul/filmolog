import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../app/app.dart';
import '../../../../../../core/core.dart';
import '../../../movies.dart';

class MoviesDetailVideosWidget extends StatelessWidget {
  const MoviesDetailVideosWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state.moviesImagesData != null &&
              state.moviesDetailData != null &&
              state.moviesDetailData!.videos!.results!.isNotEmpty,
          builder: (context) => SizedBox(
            height: 250.h,
            child: Column(
              children: [
                Text(
                  'Videolar (${state.moviesDetailData!.videos!.results!.length})',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.moviesDetailData!.videos!.results!.length,
                  itemBuilder: (context, index) {
                    var result =
                        state.moviesDetailData!.videos!.results![index];
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: AppSettings.youtubeVideoConvertor(
                                  result.key!),
                              height: 160.h,
                              width: 280.h,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  Image.network(ApiSettings.imagePath500(
                                      state.moviesDetailData!.backdropPath!)),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250.h,
                          child: Text(
                            result.name!,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )
                      ],
                    );
                  },
                )),
                const Divider(),
              ],
            ),
          ),
          fallback: (context) => const SizedBox(),
        );
      },
    );
  }
}
