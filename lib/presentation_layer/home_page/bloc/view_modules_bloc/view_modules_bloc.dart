import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sample_app/domain_layer/usecase/display.usecase.dart';
import 'package:sample_app/domain_layer/usecase/display/get_view_modules_by_store_type_and_tab_id.usecase.dart';

import '../../../../domain_layer/model/display/collection/collection.model.dart';
import '../../../../domain_layer/model/display/view_module/view_module.model.dart';
import '../collections_bloc/collections_bloc.dart';

part 'view_modules_event.dart';

part 'view_modules_state.dart';

part 'view_modules_bloc.freezed.dart';

enum ViewModulesStatus { initial, loading, success, failure }

class ViewModulesBloc extends Bloc<ViewModulesEvent, ViewModulesState> {
  final DisplayUsecase _displayUsecase;

  ViewModulesBloc(this._displayUsecase) : super(ViewModulesState()) {
    on<ViewModulesInitialized>(_onViewModulesInitialized);
    on<ViewModulesFetched>(_onViewModulesFetched);
  }

  Future<void> _onViewModulesInitialized(
    ViewModulesInitialized event,
    Emitter<ViewModulesState> emit,
  ) async {
    final storeType = event.storeType ?? StoreType.market;
    final List<Collection> collections = event.collections ?? [];

    // 사실 절대 empty 일 경우는 없다.
    if (collections.isEmpty) {
      emit(state.copyWith(status: [ViewModulesStatus.failure]));
      return;
    }

    // 초기화
    List<ViewModulesStatus> initializedStatus = [
      ...collections.map((e) => ViewModulesStatus.initial)
    ];

    // 첫번째(홈) 인 경우는 loading 초기화
    initializedStatus.first = ViewModulesStatus.loading;

    // viewModules 초기화
    Map<int, List<ViewModule>> initializedViewModules = {};
    for (final collection in collections) {
      initializedViewModules[collection.tabId] = [];
    }

    emit(
      state.copyWith(
        status: initializedStatus,
        viewModules: initializedViewModules,
      ),
    );

    try {
      final tabId = collections.first.tabId;

      final List<ViewModule> response = await _displayUsecase.fetch(
        GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
      );
      List<ViewModulesStatus> test = [...initializedStatus];
      // test.first = ViewModulesStatus.success;
      //TODO call by ref 여기 확인해봐야함
      initializedStatus.first = ViewModulesStatus.success;
      initializedViewModules[tabId] = response;

      emit(state.copyWith(
        storeType: storeType,
        collections: collections,
        status: test,
        viewModules: initializedViewModules,
      ));
    } catch (error) {
      emit(state.copyWith(status: [ViewModulesStatus.failure]));
      log('[error] $error');
    }
  }

  Future<void> _onViewModulesFetched(
    ViewModulesFetched event,
    Emitter<ViewModulesState> emit,
  ) async {
    final collections = state.collections;

    final tabIndex = event.tabIndex;
    final tabId = collections[tabIndex].tabId;

    if (tabIndex >= collections.length) return;

    List<ViewModulesStatus> status = [...state.status];
    Map<int, List<ViewModule>> viewModules = {...state.viewModules};
    // print('[test] ${status[tabIndex]}');
    // print('[test] ${viewModules[tabId]}');
    // if(viewModules[tabId]?.isNotEmpty ?? false) return;
    // if(!status[tabIndex].isSuccess && viewModules[tabId]!.isNotEmpty) return;
    // print('[test] 넘어옴?');
    try {
      status[tabIndex] = ViewModulesStatus.loading;
      emit(state.copyWith(status: status, currentIndex: tabIndex));

      final storeType = state.storeType;

      final List<ViewModule> response = await _displayUsecase.fetch(
        GetViewModulesByStoreTypeAndTabId(storeType: storeType, tabId: tabId),
      );

      // status[tabIndex] = ViewModulesStatus.success;

      List<ViewModulesStatus> test = [...status];
      test[tabIndex] = ViewModulesStatus.success;

      viewModules[tabId] = response;

      print('[test] tabIndex = $tabIndex, tabId : $tabId, ');
      emit(state.copyWith(status: test, viewModules: viewModules));
      print('[test] finished');
    } catch (error) {
      status[tabIndex] = ViewModulesStatus.failure;
      emit(state.copyWith(status: status));
      log('[error] $error');
    }
  }
}

extension ViewModulesStatusEx on ViewModulesStatus {
  bool get isInitial => this == ViewModulesStatus.initial;

  bool get isLoading => this == ViewModulesStatus.loading;

  bool get isSuccess => this == ViewModulesStatus.success;

  bool get isFailure => this == ViewModulesStatus.failure;
}
