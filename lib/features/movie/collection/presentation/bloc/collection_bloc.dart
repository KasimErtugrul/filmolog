import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../di.dart';
import '../../collection.dart';

part 'collection_event.dart';
part 'collection_state.dart';
@Injectable()
class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionDetailUsecase moviesCollectionUsecase = getIt();
  CollectionBloc() : super(const CollectionState()) {
    on<FetchCollection>((event, emit) async {
      var result = await moviesCollectionUsecase.call(event.collectionId);
      result.fold(
        (l) {
          emit(state.copyWith(moviesCollectionLoaded: false));
        },
        (r) async {
          emit(state.copyWith(
            collectionData: r.parts,
            moviesCollectionLoaded: true,
          ));
        },
      );
    });
  }
}
