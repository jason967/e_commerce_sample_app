part of 'view_modules_bloc.dart';

abstract class ViewModulesEvent {
  const ViewModulesEvent();
}

class ViewModulesInitialized extends ViewModulesEvent {
  ViewModulesInitialized({this.storeType, this.tabId});
  final StoreType? storeType;
  final int? tabId;
}

class ViewModulesChanged extends ViewModulesEvent {
  ViewModulesChanged({this.tabId});
  // final StoreType? storeType;
  final int? tabId;
}
