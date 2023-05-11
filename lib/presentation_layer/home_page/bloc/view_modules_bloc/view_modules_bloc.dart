import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/get_view_modules_by_store_type_and_tab_id.usecase.dart';

import 'package:sample_app/presentation_layer/common/bloc/store_type_cubit/store_type_cubit.dart';

import '../../../../domain_layer/model/display/view_module/view_module.model.dart';
import '../common/constant.dart';

part 'view_modules_event.dart';
part 'view_modules_state.dart';

part 'view_modules_bloc.freezed.dart';

class ViewModulesBloc extends Bloc<ViewModulesEvent, ViewModulesState> {
  final DisplayUsecase _displayUsecase;
  ViewModulesBloc(this._displayUsecase) : super(ViewModulesState()) {
    on<ViewModulesInitialized>(_onViewmodulesIntialized);
    on<ViewModulesChanged>(_onViewmodulesChanged);
  }

  Future<void> _onViewmodulesIntialized(
    ViewModulesInitialized event,
    Emitter<ViewModulesState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final storeType = event.storeType ?? StoreType.market;
      final tabId = event.tabId ?? 10001;

      final List<ViewModule> response = await _displayUsecase.fetch(
        GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
      );
      final Map<int, List<ViewModule>> viewModules = {tabId: response};
      await Future.delayed(const Duration(seconds: 3));

      emit(state.copyWith(status: Status.success, viewModules: viewModules));
    } catch (error) {
      emit(state.copyWith(status: Status.error));
      log('[error] $error');
    }
  }

  Future<void> _onViewmodulesChanged(
    ViewModulesChanged event,
    Emitter<ViewModulesState> emit,
  ) async {
    final storeType = state.storeType;
    final tabId = event.tabId ?? 10001;

    Map<int, List<ViewModule>> modules = {...state.viewModules};

    if (modules[tabId] == null) {
      try {
        emit(state.copyWith(status: Status.loading));

        final List<ViewModule> response = await _displayUsecase.fetch(
          GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
        );
        modules[tabId] = response;
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(status: Status.success, viewModules: modules));
      } catch (error) {
        emit(state.copyWith(status: Status.error));
      }
    }
  }
}
