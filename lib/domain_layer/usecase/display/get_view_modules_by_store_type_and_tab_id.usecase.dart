import 'package:sample_app/domain_layer/model/display/view_module/view_module.model.dart';
import 'package:sample_app/presentation_layer/common/bloc/store_type_cubit/store_type_cubit.dart';

import '../base_usecase/remote.usecase.dart';

import 'package:sample_app/domain_layer/repository/display.repository.dart';

class GetViewModulesByStoreTypeAndTabId
    extends RemoteUsecase<DisplayRepository> {
  GetViewModulesByStoreTypeAndTabId({
    required this.storeType,
    required this.tabId,
    this.params,
  });
  final Map<String, String>? params;
  final StoreType storeType;
  final int tabId;

  @override
  Future<List<ViewModule>> execute(DisplayRepository repository) async {
    final response = await repository.getViewModulesByStoreTypeAndTabId(
      storeType: storeType.name,
      tabId: tabId,
    );

    return response;
  }
}
