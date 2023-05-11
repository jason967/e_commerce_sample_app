import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:retrofit/retrofit.dart';

// dto
import 'package:sample_app/data_layer/dto/display.dto.dart';

part 'display_api.g.dart';

const String baseUrl = 'http://127.0.0.1:8000/';

@RestApi(baseUrl: baseUrl)
abstract class DisplayApi {
  factory DisplayApi(Dio dio, {String? baseUrl}) = _DisplayApi;

  // about collections
  @GET('/{storeType}')
  Future<List<CollectionDto>> getCollectionsByStoreType({
    @Path('storeType') required String storeType,
  });

  // about view_modules
  @GET('/{storeType}/{tabId}')
  Future<List<ViewModuleDto>> getViewModulesByStoreTypeAndTabId({
    @Path('storeType') required String storeType,
    @Path('tabId') required int tabId,
  });
}
