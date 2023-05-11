part of 'view_modules_bloc.dart';

@freezed
class ViewModulesState with _$ViewModulesState {
  factory ViewModulesState({
    @Default(Status.initial) Status status,
    @Default(StoreType.market) StoreType storeType,
    @Default({}) Map<int, List<ViewModule>> viewModules,
  }) = _ViewModulesState;
}
