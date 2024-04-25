import 'package:dartz/dartz.dart';

import '../../../../../core/core.dart';
import '../domain.dart';


abstract class MovieListRepository {
  Future<Either<Failure, MovieListEntity>> getMovieListPopular({int page = 1});
  Future<Either<Failure, MovieListEntity>> getMovieListNowPlaying({int page = 1});
}
