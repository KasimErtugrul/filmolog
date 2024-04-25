import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../domain.dart';
@LazySingleton()
class FutureTVDiscoveryUsecase
    extends BaseUseCase<FutureTvDiscoveryEntity, int> {
  final DiscoveryRepository discoveryRepository = getIt.get<DiscoveryRepository>();
  @override
  Future<Either<Failure, FutureTvDiscoveryEntity>> call(int parameter) async {
    return await discoveryRepository.getFutureTVDiscovery(page: parameter);
  }
}
