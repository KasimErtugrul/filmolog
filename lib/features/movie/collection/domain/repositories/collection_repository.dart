import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../domain.dart';

abstract class CollectionRepository{
   Future<Either<Failure, CollectionEntity>> getCollection(int collectionId);
}