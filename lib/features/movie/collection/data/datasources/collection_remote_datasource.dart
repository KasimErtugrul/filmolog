import 'package:filmolog/di.dart';
import 'package:injectable/injectable.dart';

import '../../collection.dart';

abstract class CollectionRemoteDatasource {
  Future<CollectionModel> getCollection(int collectionId);
}
@LazySingleton(as: CollectionRemoteDatasource)
class CollectionRemoteDatasourceImp extends CollectionRemoteDatasource {
  final CollectionRemote collectionRemote = getIt();
  @override
  Future<CollectionModel> getCollection(int collectionId) async {
    return await collectionRemote.getCollection(collectionId);
  }
}
