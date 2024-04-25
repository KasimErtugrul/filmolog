import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../domain.dart';


@LazySingleton()
class PeopleUsecase extends BaseUseCase<PeopleEntity, int> {
  final PeopleRepository peopleRepository = getIt.get<PeopleRepository>();

  @override
  Future<Either<Failure, PeopleEntity>> call(int parameter) async {
    return peopleRepository.getPeople(peopleId: parameter);
  }
}
