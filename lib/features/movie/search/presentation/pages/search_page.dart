import 'package:filmolog/app/app.dart';
import 'package:filmolog/features/movie/search/presentation/cubit/search_type_cubit.dart';
import 'package:filmolog/features/movie/search/presentation/widgets/search_form_widget.dart';
import 'package:filmolog/features/movie/search/presentation/widgets/search_movie_result_list.dart';
import 'package:filmolog/features/movie/search/presentation/widgets/search_person_result_list.dart';
import 'package:filmolog/features/movie/search/presentation/widgets/search_result_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../bloc/search_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchTypeCubit>(
      create: (context) => SearchTypeCubit(),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SearchPageFormWidget(),
                      Gap(15.h),
                      const SearchPageResultBoxWidget(),
                      const Divider(),
                      BlocBuilder<SearchTypeCubit, SearchTypeState>(
                        builder: (context, stateCubit) {
                          //  log('bulunan film listesinin uzunluğu: ${state.searchMultiListData[0].length}');
                          return stateCubit.searchType == SearchType.MOVIE
                              ? const SearchPageResultMovieWidget()
                              : stateCubit.searchType == SearchType.PERSON
                                  ? const SearchPageResultPerson()
                                  : const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
