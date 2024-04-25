import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../domain.dart';

@LazySingleton()
class DiscoveryWithCastUsecase extends BaseUseCase<DiscoveryWithCastEntity,
    DiscoveryWithCastModelUsecase> {
  final DiscoveryRepository discoveryRepository =
      getIt.get<DiscoveryRepository>();
  @override
  Future<Either<Failure, DiscoveryWithCastEntity>> call(
      DiscoveryWithCastModelUsecase parameter) async {
    return await discoveryRepository.getDiscoveryWithCast(
        peopleId1: parameter.peopleId1, peopleId2: parameter.peopleId2);
  }
}
