import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  final List<Widget> _tabs = const [
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
        bottom: TabBar(controller: _tabController, tabs: _tabs),
      ),
      body: TabBarView(controller: _tabController, children: const <Widget>[
        Center(child: Icon(Icons.directions_car)),
        Center(child: Icon(Icons.directions_train)),
        Center(child: Icon(Icons.directions_bike)),
      ]),
    );
  }
}
