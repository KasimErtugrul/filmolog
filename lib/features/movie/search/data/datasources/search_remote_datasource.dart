import 'package:filmolog/di.dart';
import 'package:filmolog/features/movie/search/data/datasources/remote/search_remote.dart';
import 'package:injectable/injectable.dart';

import '../models/search_multi_model.dart';
import '../models/search_people_model.dart';

abstract class SearchRemoteDatasource {
  Future<SearchPeopleModel> getSearchPeople({required query});
  Future<List<List<SearchMultResultModel>>> getSearchMulti({required query});
}

@LazySingleton(as: SearchRemoteDatasource)
class SearchRemoteDatasourceImpl extends SearchRemoteDatasource {
  final SearchRemote searchRemote = getIt.get<SearchRemote>();
  @override
  Future<SearchPeopleModel> getSearchPeople({required query}) async {
    return await searchRemote.getSearchPeople(query: query);
  }

  @override
  Future<List<List<SearchMultResultModel>>> getSearchMulti({required query}) async {
    return await searchRemote.getSearchMulti(query: query);
  }
}
