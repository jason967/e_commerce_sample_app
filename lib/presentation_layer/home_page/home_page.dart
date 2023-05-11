import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/collections_bloc/collections_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/view_modules_bloc/view_modules_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/collections_bar.dart';

import '../../injection.dart';
import 'bloc/common/constant.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              serviceLocater<CollectionsBloc>()..add(CollectionsInitialized()),
        ),
        BlocProvider(
          create: (_) =>
              serviceLocater<ViewModulesBloc>()..add(ViewModulesInitialized()),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsBloc, CollectionsState>(
        builder: (context, state) {
      final collections = state.collections;
      switch (state.status) {
        case Status.initial:
          return const LoadingCollectionsBar();
        case Status.loading:
          return const LoadingCollectionsBar();
        case Status.success:
          return CollectionsBar(collections);
        case Status.error:
          return const LoadingCollectionsBar();
      }
    });
  }
}

class LoadingCollectionsBar extends StatelessWidget {
  const LoadingCollectionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
