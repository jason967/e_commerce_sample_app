import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/bloc/store_type_cubit/store_type_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(providers: [], child: const HomeView());
    return HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Container(
              width: 300,
              height: 400,
              color: Colors.yellow,
              child: Center(
                child: Text(context.watch<StoreTypeCubit>().state.name),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
