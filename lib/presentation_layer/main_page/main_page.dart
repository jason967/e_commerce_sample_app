import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/presentation_layer/main_page/bloc/store_type_cubit/store_type_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => StoreTypeCubit()),
      ],
      child: const MainView(),
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            borderRadius: BorderRadius.circular(25),
          ),
          height: 34,
          width: 180,
          child: TabBar(
            // onTap: _tappedTypeChangeBtn,
            onTap: context.read<StoreTypeCubit>().changeStoreType,
            labelPadding: const EdgeInsets.only(top: 6),
            labelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            // labelColor: Colors.purple,
            unselectedLabelColor: Colors.white,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.green,
            ),
            controller: _tabController,
            tabs: [
              Text(StoreType.values[0].name),
              Text(StoreType.values[1].name),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 400,
          color: Colors.yellow,
          child:
              Center(child: Text(context.watch<StoreTypeCubit>().state.name)),
        ),
      ),
    );
  }
}
