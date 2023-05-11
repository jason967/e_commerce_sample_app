part of 'collections_bloc.dart';

@freezed
class CollectionsState with _$CollectionsState {
  factory CollectionsState({
    @Default(Status.initial) Status status,
    @Default(<Collection>[]) List<Collection> collections,
  }) = _CollectionsState;
}
