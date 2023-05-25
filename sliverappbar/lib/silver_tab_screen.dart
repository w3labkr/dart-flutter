import 'package:flutter/material.dart';

class SilverTabScreen extends StatefulWidget {
  const SilverTabScreen({Key? key}) : super(key: key);

  @override
  State<SilverTabScreen> createState() => _SilverTabScreenState();
}

class _SilverTabScreenState extends State<SilverTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: false,
                expandedHeight: 350.0,
                title: const Text('SliverAppBar'),
                flexibleSpace: FlexibleSpaceBar(
                  background:
                      Image.asset('assets/images/one.jpg', fit: BoxFit.cover),
                ),
              ),
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.flight)),
                      Tab(icon: Icon(Icons.directions_transit)),
                      Tab(icon: Icon(Icons.directions_car)),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: const TabBarView(
            children: [
              Center(child: Icon(Icons.flight, size: 350)),
              Center(child: Icon(Icons.directions_transit, size: 350)),
              Center(child: Icon(Icons.directions_car, size: 350)),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
