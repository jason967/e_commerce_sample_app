import 'package:get_it/get_it.dart';
import 'data_layer/common/dio/rest_client.dart';

/// place holder
/// api
import 'package:sample_app/data_layer/data_source/remote/place_holder_api_sample.dart';

/// repository
import 'package:sample_app/data_layer/repository/place_holder.repositoryImpl.dart';
import 'package:sample_app/domain_layer/repository/place_holder.dart';

/// usecase
import 'package:sample_app/domain_layer/usecase/place_holder.usecase.dart';

/// bloc
import 'presentation_layer/user_page_sample/bloc/user_page_sample_bloc.dart';

final serviceLocater = GetIt.instance;

Function registerSingleton = serviceLocater.registerSingleton;
Function registerFactory = serviceLocater.registerFactory;

void initDependencyInjection() {
  _dataLayer();
  _domainLayer();
  _presentationLayer();
}

void _dataLayer() {
  // dio
  final dio = RestClient().getDio;

  // data_source
  registerSingleton<PlaceHolderApi>(PlaceHolderApi(dio));
}

void _domainLayer() {
  // ------ repository ------
  registerSingleton<PlaceHolderRepository>(
      PlaceHolderRepositoryImpl(serviceLocater<PlaceHolderApi>()));

  // ------ usecase ------
  registerSingleton<PlaceHolderUsecase>(
    PlaceHolderUsecase(serviceLocater<PlaceHolderRepository>()),
  );
}

void _presentationLayer() {
  //bloc
  registerFactory<UserBloc>(
      () => UserBloc(serviceLocater<PlaceHolderUsecase>()));
}
