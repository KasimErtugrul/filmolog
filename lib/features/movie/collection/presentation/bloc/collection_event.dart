part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable {
  const CollectionEvent();

  @override
  List<Object> get props => [];
}

class FetchCollection extends CollectionEvent {
  final int collectionId;

  const FetchCollection({required this.collectionId});
  @override
  List<Object> get props => [collectionId];
}
