
import 'package:filmolog/core/core.dart';
import 'package:filmolog/features/movie/search/data/models/search_multi_model.dart';
import 'package:filmolog/features/movie/search/data/models/search_people_model.dart';
import 'package:injectable/injectable.dart';
import 'dart:async';

@LazySingleton()
class SearchRemote {
  Future<SearchPeopleModel> getSearchPeople({required query}) async {
    // 1 saniyelik gecikme ekleyerek isteği bekletiyoruz
    await Future.delayed(const Duration(seconds: 1));

    // Gerçek isteği yapıyoruz ve sonucu döndürüyoruz
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.search
        .queryPeople(query) as Map<String, dynamic>;
    return SearchPeopleModel.fromMap(result);
  }

  Future<List<List<SearchMultResultModel>>> getSearchMulti(
      {required query}) async {
    await Future.delayed(const Duration(seconds: 1));

    Map<String, dynamic> result =
        await BaseTmdb.tmdb.v3.search.queryMulti(query) as Map<String, dynamic>;

    List<dynamic> resultList = result['results'] ?? [];
    // log('bulunan liste ${resultList.toString()}');
    List<List<SearchMultResultModel>> multiList = List.generate(3, (_) => []);

    for (var item in resultList) {
      String mediaType = item['media_type'] as String? ?? '';
      SearchMultResultModel resultItem = SearchMultResultModel.fromMap(item);

      switch (mediaType) {
        case 'movie':
          multiList[0].add(resultItem);

          break;
        case 'tv':
          multiList[1].add(resultItem);

          break;
        case 'person':
          multiList[2].add(resultItem);

          break;
        default:
          break;
      }
    }

    return multiList;
  }
}
