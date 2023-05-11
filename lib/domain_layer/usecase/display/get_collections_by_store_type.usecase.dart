import 'package:sample_app/presentation_layer/common/bloc/store_type_cubit/store_type_cubit.dart';

import '../base_usecase/remote.usecase.dart';

import 'package:sample_app/domain_layer/model/display/collection/collection.model.dart';
import 'package:sample_app/domain_layer/repository/display.repository.dart';

class GetCollectionsByStoreType extends RemoteUsecase<DisplayRepository> {
  GetCollectionsByStoreType({required this.storeType, this.params});
  final Map<String, String>? params;
  final StoreType storeType;

  @override
  Future<List<Collection>> execute(DisplayRepository repository) async {
    final response =
        await repository.getCollectionsByStoreType(storeType: storeType.name);

    return response;
  }
}
