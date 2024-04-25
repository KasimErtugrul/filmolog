import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/core.dart';
import '../../../../../di.dart';
import '../domain.dart';
@LazySingleton()
class MoviesImagesUsecase extends BaseUseCase<MoviesImagesEntity, int> {
  final MoviesDetailRepository moviesDetailRepository = getIt();
  @override
  Future<Either<Failure, MoviesImagesEntity>> call(int parameter) async {
    return await moviesDetailRepository.getMoviesImages(parameter);
  }
}
