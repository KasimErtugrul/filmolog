import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import '../../domain/domain.dart';

part 'people_event.dart';
part 'people_state.dart';

@Injectable()
class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {
  final PeopleUsecase peopleUsecase = getIt.get<PeopleUsecase>();
  PeopleBloc() : super(const PeopleState()) {
    on<FetchPeople>((event, emit) async {
      var result = await peopleUsecase.call(event.peopleId);
      result.fold((l) {
        emit(state.copyWith(peopleLoaded: false));
      }, (r) {
        emit(state.copyWith(peopleData: r, peopleLoaded: true));
      });
    });
  }
}
