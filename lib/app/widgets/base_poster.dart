import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/core.dart';

class BasePoster extends StatelessWidget {
  final String? posterPath;
  final String? title;
  final String? voteAverage;
  final String? releaseDate;

  const BasePoster(
      {super.key,
      this.posterPath,
      this.title,
      this.voteAverage,
      this.releaseDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          posterPath != null
              ? Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: ApiSettings.imagePath500(posterPath!),
                        height: AppSize.s120.h,
                        width: 80.h,
                      ),
                    ),
                    Positioned(
                        top: 5.h,
                        left: 5.h,
                        child: Container(
                          padding: EdgeInsets.all(2.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black54,
                          ),
                          child: Text(
                            voteAverage ?? '',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        )),
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/no_image.png',
                    height: AppSize.s120.h,
                    cacheWidth: 270,
                    cacheHeight: 406,
                  ),
                ),
          SizedBox(
            width: 80.h,
            child: Text(
              title!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Text(
            ApiSettings.compareDates(
                releaseDate!.isEmpty ? '1990-01-01' : releaseDate!),
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
