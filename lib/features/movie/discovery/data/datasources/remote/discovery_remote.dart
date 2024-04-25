
import 'package:filmolog/features/movie/discovery/data/models/discovery_with_cast_model.dart';
import 'package:injectable/injectable.dart';

import 'package:intl/intl.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../../../../core/core.dart';
import '../../data.dart';

@lazySingleton
class DiscoveryMoviesRemote {
  //final CacheManager _cacheManager;

//  DiscoveryMoviesRemote()
 //     : _cacheManager = CacheManager(Config('discovery_movies_cache',
 //           stalePeriod: const Duration(hours: 1)));

  String _getYearEnd() {
    DateTime now = DateTime.now();
    int currentYear = now.year;
    String yearEnd = '$currentYear-12-31';
    return yearEnd;
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return formattedDate;
  }

  String _subTwoMonths() {
    // Şu anki tarihi al
    DateTime currentDate = DateTime.now();

    // İki ay çıkararak yeni tarihi hesapla
    DateTime newDate = currentDate.subtract(const Duration(hours: 1));

    // Yeni tarihi 'yyyy-MM-dd' formatında dönüştür ve geri döndür
    String formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
    return formattedDate;
  }

  String _afterTwoMonths() {
    // Şu anki tarihi al
    DateTime currentDate = DateTime.now();

    // İki ay ekleyerek yeni tarihi hesapla
    DateTime newDate = currentDate.add(const Duration(days: 60));

    // Yeni tarihi 'yyyy-MM-dd' formatında dönüştür ve geri döndür
    String formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
    return formattedDate;
  }

  Future<FutureMoviesModel> getFutureTurkishMovies({int page = 1}) async {
    /*
    final key = 'future_turkish_movies_page$page';
    final fileInfo = await _cacheManager.getFileFromCache(key);
    if (fileInfo != null && !fileInfo.validTill.isBefore(DateTime.now())) {
      final jsonData = await fileInfo.file.readAsString();
      final result = jsonDecode(jsonData);
      return FutureMoviesModel.fromMap(result);
    }
*/
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.discover.getMovies(
      certificationCountry: 'TR',
      page: page,
      releaseDateGreaterThan: _getCurrentDate(),
      releaseDateLessThan: _getYearEnd(),
      voteAverageGreaterThan: 0,
      voteAverageLessThan: 10,
      watchRegion: 'TR',
      withOrginalLanguage: 'tr',
      withReleaseType: '3|1|4|5|6',
      withRunTimeGreaterThan: 0,
      withRuntimeLessThan: 400,
    ) as Map<String, dynamic>;

  //  final jsonResult = jsonEncode(result);
   // await _cacheManager.putFile(key, utf8.encode(jsonResult));

    return FutureMoviesModel.fromMap(result);
  }

  Future<FutureMoviesModel> getNowPlayingTurkishMovies({int page = 1}) async {
    /*
    final key = 'now_playing_turkish_movies_page$page';
    final fileInfo = await _cacheManager.getFileFromCache(key);
    if (fileInfo != null && !fileInfo.validTill.isBefore(DateTime.now())) {
      final jsonData = await fileInfo.file.readAsString();
      final result = jsonDecode(jsonData);
      return FutureMoviesModel.fromMap(result);
    }
*/
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.discover.getMovies(
      sortBy: SortMoviesBy.releaseDateDesc,
      certificationCountry: 'TR',
      page: page,
      releaseDateGreaterThan: _subTwoMonths(),
      releaseDateLessThan: _getYearEnd(),
      voteAverageGreaterThan: 0,
      voteAverageLessThan: 10,
      watchRegion: 'TR',
      withOrginalLanguage: 'tr',
      withReleaseType: '3',
      withRunTimeGreaterThan: 0,
      withRuntimeLessThan: 400,
    ) as Map<String, dynamic>;

  //  final jsonResult = jsonEncode(result);
   // await _cacheManager.putFile(key, utf8.encode(jsonResult));

    return FutureMoviesModel.fromMap(result);
  }

  Future<FutureTvDiscoveryModel> getFutureTVDiscovery({int page = 1}) async {
    /*
    final key = 'future_tv_discovery_page$page';
    final fileInfo = await _cacheManager.getFileFromCache(key);
    if (fileInfo != null && !fileInfo.validTill.isBefore(DateTime.now())) {
      final jsonData = await fileInfo.file.readAsString();
      final result = jsonDecode(jsonData);
      return FutureTvDiscoveryModel.fromMap(result);
    }
*/
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.discover.getTvShows(
      airDateGte: _getCurrentDate(),
      airDateLte: _afterTwoMonths(),
      page: page,
      sortBy: SortTvShowsBy.firstAirDateDesc,
      voteAverageGte: 0,
      watchRegion: 'TR',
      withOrginalLanguage: 'tr',
      withRuntimeGte: 0,
      withRuntimeLte: 400,
    ) as Map<String, dynamic>;

  //  final jsonResult = jsonEncode(result);
  //  await _cacheManager.putFile(key, utf8.encode(jsonResult));

    return FutureTvDiscoveryModel.fromMap(result);
  }

  Future<DiscoveryWithCastModel> getDiscoveryWithCast(
      {required String peopleId1, required String peopleId2}) async {
    Map<String, dynamic> result = await BaseTmdb.tmdb.v3.discover.getMovies(
      withCast: '$peopleId1,$peopleId2',
    ) as Map<String, dynamic>;
    return DiscoveryWithCastModel.fromMap(result);
  }
}
