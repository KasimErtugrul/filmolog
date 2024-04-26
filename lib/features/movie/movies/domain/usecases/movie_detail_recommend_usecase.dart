import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../domain.dart';

@LazySingleton()
class MoviesDetailRecommendUsecase
    extends BaseUseCaseTwo<MoviesDetailSimRecoEntity, int, int> {
  final MoviesDetailRepository moviesDetailRepository = getIt();
  @override
  Future<Either<Failure, MoviesDetailSimRecoEntity>> call(int x, int y) async {
    return await moviesDetailRepository.getMoviesRecommend(movieId: x, page: y);
  }
}
