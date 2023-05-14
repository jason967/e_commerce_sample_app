import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
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
    on<ViewModulesFetched>(_onViewmodulesFetched, transformer: restartable());
  }

  Future<void> _onViewmodulesIntialized(
    ViewModulesInitialized event,
    Emitter<ViewModulesState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final storeType = event.storeType ?? StoreType.market;
      final tabId = event.tabId ?? 10001;
      Map<int, List<ViewModule>> viewModules = {};
      final List<ViewModule> response = await _displayUsecase.fetch(
        GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
      );

      viewModules[tabId] = response;
      await Future.delayed(const Duration(seconds: 3));

      emit(state.copyWith(
        status: Status.success,
        viewModules: viewModules,
        storeType: storeType,
      ));
    } catch (error) {
      emit(state.copyWith(status: Status.error));
      log('[error] $error');
    }
  }

  Future<void> _onViewmodulesFetched(
    ViewModulesFetched event,
    Emitter<ViewModulesState> emit,
  ) async {
    final storeType = state.storeType;
    final tabId = event.tabId ?? 10001;

    Map<int, List<ViewModule>> modules = {...state.viewModules};

    log('[test] fetch ${modules[tabId]}');
    if (modules[tabId] == null) {
      try {
        emit(state.copyWith(status: Status.loading));
        // log('[test] init!');
        final List<ViewModule> response = await _displayUsecase.fetch(
          GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
        );
        modules[tabId] = response;
        // await Future.delayed(const Duration(milliseconds: 500));
        emit(state.copyWith(status: Status.success, viewModules: modules));
      } catch (error) {
        emit(state.copyWith(status: Status.error));
        log('[error] $error');
      }
    } else {
      log('[test] fetch 안됌');
      emit(state.copyWith(status: Status.success, viewModules: modules));
    }
  }
}
