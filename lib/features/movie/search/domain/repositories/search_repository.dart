import 'package:dartz/dartz.dart';
import 'package:filmolog/core/core.dart';
import 'package:filmolog/features/movie/search/domain/entities/search_multi_entity.dart';
import 'package:filmolog/features/movie/search/domain/entities/search_people_entity.dart';

abstract class SearchRepository {
  Future<Either<Failure, SearchPeopleEntity>> getSeachPeople(
      {required String query});
  Future<Either<Failure, List<List<SearchMultiResultEntity>>>> getSearchMulti(
      {required String query});
}
