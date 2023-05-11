import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/view_modules_bloc/view_modules_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_module_list.dart';

import '../../../domain_layer/model/display/collection/collection.model.dart';
import '../bloc/common/constant.dart';

class CollectionsBar extends StatefulWidget {
  const CollectionsBar(this.collections, {super.key});
  final List<Collection> collections;

  @override
  State<CollectionsBar> createState() => _CollectionsBarState();
}

class _CollectionsBarState extends State<CollectionsBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.collections.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('[test] test : ${widget.collections}');
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: TabBar(
              controller: _tabController,
              tabs: widget.collections
                  .map((e) => Tab(
                        child: Text(
                          e.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ))
                  .toList()),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              BlocBuilder<ViewModulesBloc, ViewModulesState>(
                builder: (context, state) {
                  final viewModules = state.viewModules;

                  switch (state.status) {
                    case Status.initial:
                      return const LoadingViewModuleList();
                    case Status.loading:
                      return const LoadingViewModuleList();
                    case Status.success:
                      return ViewModuleList(viewModules[10001] ?? []);
                    case Status.error:
                      return const LoadingViewModuleList();
                  }
                },
              ),
              Container(
                height: 400,
                color: Colors.orange,
              ),
              Container(
                height: 400,
                color: Colors.yellow,
              ),
              Container(
                height: 400,
                color: Colors.green,
              ),
              Container(
                height: 400,
                color: Colors.blue,
              ),
            ],
          ),
        )
      ],
    );
  }
}
