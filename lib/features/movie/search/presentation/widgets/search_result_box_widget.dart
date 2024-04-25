import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:filmolog/features/movie/search/presentation/cubit/search_type_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/util/app_settings.dart';
import '../bloc/search_bloc.dart';

class SearchPageResultBoxWidget extends StatelessWidget {
  const SearchPageResultBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state.searchMultiLoaded,
          builder: (context) => Card(
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: const Center(child: Text('Bulunan Sonuçlar')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            context
                                .read<SearchTypeCubit>()
                                .changeSearchType(SearchType.MOVIE);
                          },
                          child: Text(
                              'Filmler ${state.searchMultiListData[0].length.toString()}')),
                      TextButton(
                          onPressed: () {
                            context
                                .read<SearchTypeCubit>()
                                .changeSearchType(SearchType.TV);
                          },
                          child: Text(
                              'Diziler ${state.searchMultiListData[1].length.toString()}')),
                      TextButton(
                          onPressed: () {
                            context
                                .read<SearchTypeCubit>()
                                .changeSearchType(SearchType.PERSON);
                          },
                          child: Text(
                              'Kişiler ${state.searchMultiListData[2].length.toString()}')),
                    ],
                  ),
                ),
              ],
            ),
          ),
          fallback: (context) => const SizedBox(),
        );
      },
    );
  }
}