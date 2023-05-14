part of 'view_modules_bloc.dart';

abstract class ViewModulesEvent {
  const ViewModulesEvent();
}

class ViewModulesInitialized extends ViewModulesEvent {
  ViewModulesInitialized({this.storeType, this.tabId});
  final StoreType? storeType;
  final int? tabId;
}

class ViewModulesFetched extends ViewModulesEvent {
  ViewModulesFetched({this.tabId});
  final int? tabId;
}
