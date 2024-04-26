import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/core.dart';
import '../../../movies.dart';



class MoviesDetailImagesBackdropWidget extends StatelessWidget {
  const MoviesDetailImagesBackdropWidget({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Arka Plan Resimleri (${state.moviesImagesData!.backdrops!.length})'),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state
                    .moviesImagesData!.backdrops!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var backDropResult = state
                      .moviesImagesData!.backdrops![index];
                  return ConditionalBuilder(
                    condition: state
                            .moviesImagesData!.backdrops !=
                        null,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: CachedNetworkImage(
                          imageUrl: ApiSettings.imagePath500(
                              backDropResult.filePath!),
                          fit: BoxFit.cover,
                          height: 50.h,
                        
                        ),
                      ),
                    ),
                    fallback: (context) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        imageUrl: ApiSettings.imagePath500(
                          state
                              .moviesDetailData!.backdropPath!,
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
        );
      },
    );
  }
}
