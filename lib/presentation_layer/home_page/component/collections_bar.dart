import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/bloc/view_modules_bloc/view_modules_bloc.dart';
import 'package:sample_app/presentation_layer/home_page/component/view_module_list.dart';

import '../../../domain_layer/model/display/collection/collection.model.dart';

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

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        final tabId = widget.collections[_tabController.index].tabId;
        context.read<ViewModulesBloc>().add(ViewModulesChanged(tabId: tabId));
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: TabBar(
              controller: _tabController,
              onTap: (index) {},
              tabs: widget.collections.map((e) => GnbTab(e.title)).toList()),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.collections
                .map((e) => ViewModuleList(tabId: e.tabId))
                .toList(),
          ),
        )
      ],
    );
  }
}

class GnbTab extends StatelessWidget {
  const GnbTab(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
