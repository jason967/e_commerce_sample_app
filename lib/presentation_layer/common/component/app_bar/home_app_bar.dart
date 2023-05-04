import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import '../../bloc/store_type_cubit/store_type_cubit.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    )..addListener(_onChanged);
  }

  void _onChanged() {}
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      actions: const [
        IconButton(
          icon: Icon(Icons.rocket),
          color: Colors.white,
          onPressed: null,
        ),
        IconButton(
          icon: Icon(Icons.cable),
          color: Colors.white,
          onPressed: null,
        ),
      ],
      // backgroundColor: Colors.purple,
      leading: const Center(child: Text('TEST')),
      centerTitle: true,
      title: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        height: 34,
        child: TabBar(
          padding: const EdgeInsets.all(0),
          onTap: context.read<StoreTypeCubit>().changeStoreType,
          indicatorWeight: 1,
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.green,
          ),
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(
              text: StoreType.values[0].index.toString(),
            ),
            Tab(
              text: StoreType.values[1].index.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
