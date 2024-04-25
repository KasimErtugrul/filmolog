import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../app/app.dart';

part 'cast_state.dart';

@Injectable()
class CastCubit extends Cubit<CastState> {
  CastCubit() : super(const CastState());
  void setCast(CastEnum castData) {
    if (castData == CastEnum.cast) {
      //print('Cast selected');
      emit(state.copyWith(castEnum: CastEnum.cast));
    } else {
    //  print('Crew selected');
      emit(state.copyWith(castEnum: CastEnum.crew));
    }
  }
}
