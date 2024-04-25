import 'package:filmolog/di.dart';
import 'package:injectable/injectable.dart';
import '../data.dart';



abstract class PeopleRemoteDatasource {
  Future<PeopleModel> getPeople({required int peopleId});
}

@LazySingleton(as: PeopleRemoteDatasource)
class PeopleRemoteDatasourceImpl extends PeopleRemoteDatasource {
  final PeopleRemote peopleRemote = getIt.get<PeopleRemote>();
  @override
  Future<PeopleModel> getPeople({required int peopleId}) async {
    return await peopleRemote.getPeople(peopleId: peopleId);
  }
}
