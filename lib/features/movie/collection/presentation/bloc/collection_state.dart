part of 'collection_bloc.dart';

class CollectionState extends Equatable {
  final List<CollectionPartEntity> collectionData;
  final bool moviesCollectionLoaded;
  const CollectionState({
    this.collectionData = const [],
    this.moviesCollectionLoaded = false,
  });

  @override
  List<Object> get props => [];

  CollectionState copyWith({
    List<CollectionPartEntity>? collectionData,
    bool? moviesCollectionLoaded,
  }) {
    return CollectionState(
      collectionData: collectionData ?? this.collectionData,
      moviesCollectionLoaded:
          moviesCollectionLoaded ?? this.moviesCollectionLoaded,
    );
  }
}
