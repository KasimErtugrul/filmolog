import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';


import '../../../../../core/base/base_usecase.dart';
import '../../../../../core/error/failure_request.dart';
import '../../../../../di.dart';
import '../domain.dart';
@LazySingleton()
class MovieListPopularUsecase extends BaseUseCase<MovieListEntity, int> {
  final MovieListRepository movieListRepository = getIt.get<MovieListRepository>();
  @override
  Future<Either<Failure, MovieListEntity>> call(int parameter) async {
    return movieListRepository.getMovieListPopular(page: parameter);
  }
}
