import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../../collection.dart';
@LazySingleton()
class CollectionDetailUsecase extends BaseUseCase<CollectionEntity, int> {
  final CollectionRepository collectionRepository = getIt();
  @override
  Future<Either<Failure, CollectionEntity>> call(int parameter) async {
    return await collectionRepository.getCollection(parameter);
  }
}
