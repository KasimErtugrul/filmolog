import 'package:dartz/dartz.dart';
import 'package:filmolog/features/movie/movies/domain/entities/movies_detail_sim_reco_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../domain.dart';

@LazySingleton()
class MoviesDetailSimilarUsecase
    extends BaseUseCaseTwo<MoviesDetailSimRecoEntity, int, int> {
  final MoviesDetailRepository moviesDetailRepository = getIt();
  @override
  Future<Either<Failure, MoviesDetailSimRecoEntity>> call(int x, int y) async {
    return await moviesDetailRepository.getMoviesSimilar(movieId: x, page: y);
  }
}
