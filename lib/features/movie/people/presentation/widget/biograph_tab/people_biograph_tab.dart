import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../core/core.dart';
import '../../../people.dart';

class PeopleBiographTabWidget extends StatelessWidget {
  const PeopleBiographTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeopleBloc, PeopleState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              ConditionalBuilder(
                condition: state.peopleData!.biography != null &&
                    state.peopleData!.biography!.isNotEmpty,
                builder: (context) => Column(
                  children: [
                    SizedBox(
                      child: Text(
                        'Hakkında',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    ReadMoreText(
                      state.peopleData!.biography!,
                      style: TextStyle(fontSize: 12.h),
                      //trimLines: 30,
                      preDataTextStyle: Theme.of(context).textTheme.bodySmall,
                      postDataTextStyle: Theme.of(context).textTheme.bodySmall,
                      moreStyle: const TextStyle(color: Colors.red),
                      lessStyle: const TextStyle(color: Colors.blue),
                      delimiterStyle: Theme.of(context).textTheme.bodySmall,
                      trimCollapsedText: 'daha fazla',
                      trimExpandedText: 'daha az',
                      //
                    ),
                    const Divider(),
                  ],
                ),
                fallback: (context) => const SizedBox(),
              ),
              ConditionalBuilder(
                condition: state.peopleData!.images!.profiles!.isNotEmpty,
                builder: (context) => Column(
                  children: [
                    Text(
                      'Fotoğraflar',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 200.h,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.peopleData!.images!.profiles!.length,
                          itemBuilder: (context, index) {
                            var result =
                                state.peopleData!.images!.profiles![index];
                            return Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: CachedNetworkImage(
                                  imageUrl: ApiSettings.imagePath500(
                                      result.filePath!),
                                  fit: BoxFit.cover,
                                  width: 100.h,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const Divider()
                  ],
                ),
                fallback: (context) => const SizedBox(),
              ),
            ],
          ),
        );
      },
    );
  }
}
