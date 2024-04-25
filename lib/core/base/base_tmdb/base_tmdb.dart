import 'package:tmdb_api/tmdb_api.dart';

class BaseTmdb {
  static TMDB tmdb = TMDB(ApiKeys('dbf535aa74e4b36e96011728fa5f6f01', ''),
      defaultLanguage: 'tr-TR',
      logConfig: const ConfigLogger(showUrlLogs: true, showLogs: true));
}
