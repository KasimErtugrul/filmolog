import 'package:injectable/injectable.dart';
import '../../../../../../core/core.dart';
import '../../data.dart';

@LazySingleton()
class PeopleRemote {
  Future<PeopleModel> getPeople({required int peopleId}) async {
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.people.getDetails(
      peopleId,
      appendToResponse: 'combined_credits,external_ids,images,movie_credits,tagged_images,tv_credits',
    ) as Map<String, dynamic>;
    return PeopleModel.fromMap(result);
  }
}
//%2Cmovie_credits%2Ctv_credits