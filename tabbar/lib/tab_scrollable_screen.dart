import 'package:flutter/material.dart';

class TabScrollableScreen extends StatefulWidget {
  const TabScrollableScreen({Key? key}) : super(key: key);

  @override
  State<TabScrollableScreen> createState() => _TabScrollableScreenState();
}

class _TabScrollableScreenState extends State<TabScrollableScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  final List<Widget> _tabs = const [
    Tab(text: 'Car'),
    Tab(text: 'Transit'),
    Tab(text: 'Bike'),
    Tab(text: 'Car'),
    Tab(text: 'Transit'),
    Tab(text: 'Bike'),
    Tab(text: 'Car'),
    Tab(text: 'Transit'),
    Tab(text: 'Bike'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: _tabs)),
        ),
      ),
      body: TabBarView(controller: _tabController, children: const <Widget>[
        Center(child: Icon(Icons.directions_car)),
        Center(child: Icon(Icons.directions_train)),
        Center(child: Icon(Icons.directions_bike)),
        Center(child: Icon(Icons.directions_car)),
        Center(child: Icon(Icons.directions_train)),
        Center(child: Icon(Icons.directions_bike)),
        Center(child: Icon(Icons.directions_car)),
        Center(child: Icon(Icons.directions_train)),
        Center(child: Icon(Icons.directions_bike)),
      ]),
    );
  }
}
