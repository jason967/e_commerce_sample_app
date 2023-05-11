part of 'collections_bloc.dart';

abstract class CollectionsEvent {
  const CollectionsEvent();
}

class CollectionsInitialized extends CollectionsEvent {
  CollectionsInitialized({this.storeType});
  final StoreType? storeType;
}
