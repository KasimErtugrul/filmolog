import 'package:dartz/dartz.dart';
import 'package:filmolog/core/core.dart';
import 'package:filmolog/di.dart';
import 'package:filmolog/features/movie/search/data/datasources/search_remote_datasource.dart';
import 'package:filmolog/features/movie/search/domain/entities/search_multi_entity.dart';
import 'package:filmolog/features/movie/search/domain/entities/search_people_entity.dart';
import 'package:filmolog/features/movie/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchRepository)
class SearchRepositoryImpl extends SearchRepository {
  final SearchRemoteDatasource searchRemoteDataSource =
      getIt.get<SearchRemoteDatasource>();

  @override
  Future<Either<Failure, SearchPeopleEntity>> getSeachPeople(
      {required String query}) async {
    try {
      var result = await searchRemoteDataSource.getSearchPeople(query: query);
      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
   Future<Either<Failure, List<List<SearchMultiResultEntity>>>> getSearchMulti(
      {required String query}) async {
    try {
      var result = await searchRemoteDataSource.getSearchMulti(query: query);
      return Right(result);
    } on ServiceException catch (failure) {
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }
}
