import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../../domain/domain.dart';
import '../data.dart';



@LazySingleton(as: PeopleRepository)
class PeopleRepositoryImpl extends PeopleRepository {
  final PeopleRemoteDatasource peopleRemoteDatasource =
      getIt.get<PeopleRemoteDatasource>();
  @override
  Future<Either<Failure, PeopleEntity>> getPeople(
      {required int peopleId}) async {
    var result = await peopleRemoteDatasource.getPeople(peopleId: peopleId);
    try {
      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
