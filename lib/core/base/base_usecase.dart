import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../core.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<Failure, T>> call(Parameter parameter);
}

abstract class BaseUseCaseTwo<T, X, Y> {
  Future<Either<Failure, T>> call(X x, Y y);
}
//{required int movieId, int page=1}

class NoParameter extends Equatable {
  const NoParameter();

  @override
  List<Object?> get props => [];
}

class DiscoveryWithCastModelUsecase {
  final String peopleId1;
  final String peopleId2;

  DiscoveryWithCastModelUsecase(
      {required this.peopleId1, required this.peopleId2});
}
