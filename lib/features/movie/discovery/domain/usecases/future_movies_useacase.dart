
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../domain.dart';
@LazySingleton()
class FutureMoviesUseacase extends BaseUseCase<FutureMoviesEntity, int> {
  final DiscoveryRepository discoveryRepository = getIt.get<DiscoveryRepository>();
  @override
  Future<Either<Failure, FutureMoviesEntity>> call(int parameter) async {
   
    return await discoveryRepository.getFutureTurkishMovies(page: parameter);
  }
}
