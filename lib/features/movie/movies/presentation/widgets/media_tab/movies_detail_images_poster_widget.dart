import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/core.dart';
import '../../../../movie.dart';

class MoviesDetailImagesPosterWidget extends StatelessWidget {
  const MoviesDetailImagesPosterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state.moviesImagesData!.posters!.isNotEmpty,
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Posterler (${state.moviesImagesData!.posters!.length})'),
              SizedBox(
                height: 125.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.moviesImagesData!.posters!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var posterResult = state.moviesImagesData!.posters![index];
                    return ConditionalBuilder(
                      condition: state.moviesImagesData!.posters != null,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          child: CachedNetworkImage(
                            imageUrl: ApiSettings.imagePath500(
                                posterResult.filePath!),
                            fit: BoxFit.cover,
                            width: 85.h,
                            //height: 25.h,
                          ),
                        ),
                      ),
                      fallback: (context) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CachedNetworkImage(
                          imageUrl: ApiSettings.imagePath500(
                            state.moviesDetailData!.posterPath!,
                          ),
                          fit: BoxFit.cover,
                          height: 50.h,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Divider(),
            ],
          ),
          fallback: (context) => SizedBox.shrink(),
        );
      },
    );
  }
}
