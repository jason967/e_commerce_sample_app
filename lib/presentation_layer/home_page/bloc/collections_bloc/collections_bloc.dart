import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';

import 'package:sample_app/domain_layer/model/display/collection/collection.model.dart';
import 'package:sample_app/domain_layer/usecase/display/get_collections_by_store_type.usecase.dart';
import 'package:sample_app/presentation_layer/common/bloc/store_type_cubit/store_type_cubit.dart';

import '../common/constant.dart';

part 'collections_event.dart';
part 'collections_state.dart';

part 'collections_bloc.freezed.dart';

class CollectionsBloc extends Bloc<CollectionsEvent, CollectionsState> {
  final DisplayUsecase _displayUsecase;
  CollectionsBloc(this._displayUsecase) : super(CollectionsState()) {
    on<CollectionsInitialized>(_onCollectionsIntialized);
  }

  Future<void> _onCollectionsIntialized(
    CollectionsInitialized event,
    Emitter<CollectionsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final storeType = event.storeType;
      final List<Collection> collections = await _displayUsecase.fetch(
          GetCollectionsByStoreType(storeType: storeType ?? StoreType.market));
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(status: Status.success, collections: collections));
    } catch (error) {
      emit(state.copyWith(status: Status.initial));
      log('[error] $error');
    }
  }
}
