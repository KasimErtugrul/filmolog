import 'package:injectable/injectable.dart';
import '../../../../../../core/core.dart';
import '../../models/movie_list_model.dart';
@lazySingleton
class MovieListRemote {
 
 // final CacheManager _cacheManager;

 // MovieListRemote()
 //     : _cacheManager = CacheManager(
  //          Config('movie_list_cache', stalePeriod: const Duration(hours: 1)));

  Future<MovieListModel> getMovieListPopular({int page = 1}) async {
     /*
    final key = 'popular_page$page';
    final fileInfo = await _cacheManager.getFileFromCache(key);
    if (fileInfo != null && !fileInfo.validTill.isBefore(DateTime.now())) {
      log('popular list- $page önbellekten alındı');
      final jsonData = await fileInfo.file.readAsString();
      final result = jsonDecode(jsonData);
      return MovieListModel.fromMap(result);
    }
*/
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.movies
        .getPopular(page: page, region: 'tr') as Map<String, dynamic>;

  //  final jsonResult = jsonEncode(result);
  //  await _cacheManager.putFile(key, utf8.encode(jsonResult));

    return MovieListModel.fromMap(result);
  }

  Future<MovieListModel> getMovieListNowPlaying({int page = 1}) async {
    /*
    final key = 'now_playing_page$page';
    final fileInfo = await _cacheManager.getFileFromCache(key);
    if (fileInfo != null && !fileInfo.validTill.isBefore(DateTime.now())) {
      log('nowPlaying list- $page önbellekten alındı');
      final jsonData = await fileInfo.file.readAsString();
      final result = jsonDecode(jsonData);
      return MovieListModel.fromMap(result);
    }
*/
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.movies
        .getNowPlaying(page: page, region: 'tr') as Map<String, dynamic>;

   // final jsonResult = jsonEncode(result);
  //  await _cacheManager.putFile(key, utf8.encode(jsonResult));

    return MovieListModel.fromMap(result);
  }
}
