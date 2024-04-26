import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../app/app.dart';
import '../../../../../../core/core.dart';
import '../../movies.dart';

class MovieDetailStackWidget extends StatelessWidget {
  final String? posterPath;
  const MovieDetailStackWidget({super.key, this.posterPath});

  @override
  Widget build(BuildContext context) {
    log('poster geldi: $posterPath');
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        log('builder çalıştı');
        return ConditionalBuilder(
          condition:
              state.moviesDetailData != null && state.moviesImagesData != null,
          builder: (context) => Stack(
            children: [
              state.moviesDetailData!.backdropPath != null
                  ? ShaderMask(
                      blendMode: BlendMode.dstIn,
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 1],
                        ).createShader(
                          Rect.fromLTRB(0, 1, rect.width, rect.height),
                        );
                      },
                      child: state.moviesImagesData!.backdrops != null
                          ? CarouselSlider(
                              items: state.moviesImagesData!.backdrops!
                                  .map((e) => CachedNetworkImage(
                                        imageUrl: ApiSettings.imagePath500(
                                          e.filePath!,
                                        ),
                                        fit: BoxFit.cover,
                                      ))
                                  .toList(),
                              options: CarouselOptions(
                                //aspectRatio: .9.h,
                                //height: 300.h,
                                scrollDirection: Axis.horizontal,
                                viewportFraction: 1.h,
                                //enlargeCenterPage: true,
                                autoPlay: true,
                                // enlargeFactor: 0
                                // height: 250.h,
                              ),
                            )
                          : CachedNetworkImage(
                              imageUrl: ApiSettings.imagePath500(
                                  state.moviesDetailData!.backdropPath!),
                              fit: BoxFit.cover,
                            ),
                    )
                  : ShaderMask(
                      blendMode: BlendMode.dstIn,
                      shaderCallback: (rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.5, 1],
                        ).createShader(
                          Rect.fromLTRB(0, 1, rect.width, rect.height),
                        );
                      },
                      child: Image.asset(
                        'assets/images/no_image_backdrop.png',
                      ),
                    ),
              Positioned(
                top: 160.h,
                left: 25.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Builder(builder: (context) {
                    log('cache çekildi: $posterPath');
                    return CachedNetworkImage(
                      // cacheKey: state.moviesDetailData!.posterPath!,
                      imageUrl: ApiSettings.imagePath500(
                        posterPath != null
                            ? posterPath!
                            : ' state.moviesDetailData!.posterPath!',
                      ),
                      width: 80.h,
                    );
                  }),
                ),
              ),
              Positioned(
                top: 170.h,
                left: 110.h,
                child: SizedBox(
                  width: 220.w,
                  //color: Colors.yellow,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.moviesDetailData!.title ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        state.moviesDetailData!.originalTitle ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 10.h),
                      ),
                      Row(
                        children: [
                          Text(
                            AppSettings.voteAverageString(
                                state.moviesDetailData!.voteAverage ?? 0.0),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Icon(
                            Icons.star,
                            size: 10.w,
                            color: Colors.amber,
                          ),
                          Gap(5.w),
                          Text(
                            '- ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            ApiSettings.formatMonthAndYear(
                                state.moviesDetailData!.releaseDate!.isEmpty
                                    ? '1990-01-01'
                                    : state.moviesDetailData!.releaseDate!),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            ' - ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            AppSettings.convertToRuntime(
                                state.moviesDetailData!.runtime!),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Gap(5.h),
                      SizedBox(
                        height: 15.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.moviesDetailData!.genres!.length,
                          itemBuilder: (context, indexGenre) {
                            var genre =
                                state.moviesDetailData!.genres![indexGenre];
                            return Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: .2)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  child: Center(
                                    child: Text(
                                      ApiSettings.getGenreName(genre.id!),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          fallback: (context) => const SizedBox(),
        );
      },
    );
  }
}
