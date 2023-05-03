import 'package:get_it/get_it.dart';
import 'package:sample_app/data_layer/data_source/remote/place_holder_api_sample.dart';
import 'package:sample_app/data_layer/repository/place_holder.repositoryImpl.dart';
import 'package:sample_app/domain_layer/repository/place_holder.dart';
import 'package:sample_app/domain_layer/usecase/place_holder.usecase.dart';

import 'data_layer/common/dio/rest_client.dart';

final serviceLocater = GetIt.instance;

Function registerSingleton = serviceLocater.registerSingleton;
Function registerFactory = serviceLocater.registerFactory;

void initDependencyInjection() {
  _dataLayer();
  _domainLayer();
}

void _dataLayer() {
  // dio
  final dio = RestClient().getDio;

  // data_source
  registerSingleton<PlaceHolderApi>(PlaceHolderApi(dio));
}

void _domainLayer() {
  //repository
  registerSingleton<PlaceHolderRepository>(
      PlaceHolderRepositoryImpl(serviceLocater<PlaceHolderApi>()));

  // usecase
  registerSingleton<PlaceHolderUsecase>(
    PlaceHolderUsecase(serviceLocater<PlaceHolderRepository>()),
  );
}
