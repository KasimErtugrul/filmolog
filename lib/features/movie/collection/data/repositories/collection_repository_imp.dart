import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../../collection.dart';
@LazySingleton(as: CollectionRepository)
class CollectionRepositoryImp extends CollectionRepository {
  final CollectionRemote collectionRemote = getIt();
  @override
  Future<Either<Failure, CollectionEntity>> getCollection(
      int collectionId) async {
    try {
      var result = await collectionRemote.getCollection(collectionId);

      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
