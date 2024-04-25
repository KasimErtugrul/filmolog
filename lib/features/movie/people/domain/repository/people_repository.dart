import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../domain.dart';


abstract class PeopleRepository {
  Future<Either<Failure, PeopleEntity>> getPeople({required int peopleId});
}
