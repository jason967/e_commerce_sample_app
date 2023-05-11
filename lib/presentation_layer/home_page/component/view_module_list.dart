import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/common/constant.dart';
import '../bloc/view_modules_bloc/view_modules_bloc.dart';

//Test 용 color map
const testColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.cyan,
  Colors.teal,
  Colors.lime,
  Colors.purple,
];

class ViewModuleList extends StatelessWidget {
  const ViewModuleList({required this.tabId, super.key});
  final int tabId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewModulesBloc, ViewModulesState>(
      builder: (context, state) {
        final viewModules = state.viewModules;
        switch (state.status) {
          case Status.initial:
            return const LoadingViewModuleList();
          case Status.loading:
            return const LoadingViewModuleList();
          case Status.success:
            return SingleChildScrollView(
              child: Column(
                children: (viewModules[tabId] ?? [])
                    .asMap()
                    .entries
                    .map(
                      (e) => Container(
                        height: 200,
                        color: testColors[e.key],
                        child: Center(
                          child: Text(e.value.type),
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          case Status.error:
            return const LoadingViewModuleList();
        }
      },
    );
  }
}

class LoadingViewModuleList extends StatelessWidget {
  const LoadingViewModuleList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 400,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
