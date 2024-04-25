import 'package:dartz/dartz.dart';
import 'package:filmolog/core/core.dart';
import 'package:filmolog/di.dart';
import 'package:filmolog/features/movie/search/domain/entities/search_multi_entity.dart';
import 'package:filmolog/features/movie/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SearchMultiUsecase extends BaseUseCase< List<List<SearchMultiResultEntity>>, String> {
  final SearchRepository repository = getIt.get<SearchRepository>();

  @override
  Future<Either<Failure, List<List<SearchMultiResultEntity>>>> call(String parameter) async {
    return await repository.getSearchMulti(query: parameter);
  }
}
