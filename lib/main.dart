import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sample_app/domain_layer/usecase/place_holder.usecase.dart';
import 'package:sample_app/domain_layer/usecase/place_holder/get_users.usecase.dart';

import 'package:sample_app/injection.dart';

import 'presentation_layer/main_page.dart';

void main() async {
  initDependencyInjection();
  // final sample = await serviceLocater<PlaceHolderUsecase>().fetch(GetUsers());
  // log('[test] sample : $sample');
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
