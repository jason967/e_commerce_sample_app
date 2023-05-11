import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:sample_app/domain_layer/usecase/display.usecase.dart';

import 'package:sample_app/domain_layer/usecase/display/get_view_modules_by_store_type_and_tab_id.usecase.dart';

import 'package:sample_app/injection.dart';
import 'package:sample_app/presentation_layer/common/bloc/store_type_cubit/store_type_cubit.dart';

import 'presentation_layer/main_page.dart';

void main() async {
  initDependencyInjection();
  final test = await serviceLocater<DisplayUsecase>().fetch(
      GetViewModulesByStoreTypeAndTabId(
          storeType: StoreType.market, tabId: 10001));

  // final sample = await serviceLocater<PlaceHolderUsecase>().fetch(GetUsers());
  log('[test] test : $test');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}
