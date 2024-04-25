import 'package:injectable/injectable.dart';

import '../../../../../../core/core.dart';
import '../../data.dart';
@LazySingleton()
class CollectionRemote {
  Future<CollectionModel> getCollection(int collectionId) async {
      Map<String, dynamic> result = await BaseTmdb.tmdb.v3.collections
          .getDetails(collectionId) as Map<String, dynamic>;
      return CollectionModel.fromJson(result);
    }
}
