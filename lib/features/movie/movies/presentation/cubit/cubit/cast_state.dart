part of 'cast_cubit.dart';

class CastState extends Equatable {
  final CastEnum castEnum;
  const CastState({this.castEnum = CastEnum.cast});

  @override
  List<Object> get props => [castEnum];
  CastState copyWith({CastEnum? castEnum}) {
    return CastState(castEnum: castEnum ?? this.castEnum);
  }

  @override
  String toString() {
    return 'CastState{castEnum=$castEnum}';
  }
}
