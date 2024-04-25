import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../domain.dart';
@LazySingleton()
class MoviesDetailUsecase extends BaseUseCase<MoviesDetailEntity, int> {
  final MoviesDetailRepository moviesDetailRepository = getIt();
  @override
  Future<Either<Failure, MoviesDetailEntity>> call(int parameter) async {
    return await moviesDetailRepository.getMoviesDetail(parameter);
  }
}
