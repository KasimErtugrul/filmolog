import 'package:dartz/dartz.dart';
import 'package:filmolog/core/core.dart';
import 'package:filmolog/di.dart';
import 'package:filmolog/features/movie/search/domain/entities/search_people_entity.dart';
import 'package:filmolog/features/movie/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SearchPeopleUsecase extends BaseUseCase<SearchPeopleEntity, String> {
  final SearchRepository repository = getIt.get<SearchRepository>();

  @override
  Future<Either<Failure, SearchPeopleEntity>> call(String parameter) async {
    return await repository.getSeachPeople(query: parameter);
  }
}
