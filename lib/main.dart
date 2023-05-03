import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sample_app/domain_layer/repository/place_holder.dart';
import 'package:sample_app/domain_layer/usecase/place_holder.usecase.dart';
import 'package:sample_app/domain_layer/usecase/place_holder/get_post_by_id.usecase.dart';

import 'package:sample_app/injection.dart';
import 'package:sample_app/presentation_layer/main_page/main_page.dart';

void main() async {
  initDependencyInjection();
  final data =
      await serviceLocater<PlaceHolderRepository>().getPostById(id: '1');
  final usecase =
      await serviceLocater<PlaceHolderUsecase>().fetch(GetPostById(id: '0'));

  log('[test] data : $usecase');
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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const MainPage(),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
