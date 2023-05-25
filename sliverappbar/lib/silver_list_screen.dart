import 'package:flutter/material.dart';

class SilverListScreen extends StatefulWidget {
  const SilverListScreen({Key? key}) : super(key: key);

  @override
  State<SilverListScreen> createState() => _SilverListScreenState();
}

class _SilverListScreenState extends State<SilverListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            expandedHeight: 350.0,
            title: const Text('SliverAppBar'),
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Image.asset('assets/images/one.jpg', fit: BoxFit.cover),
            ),
            bottom: AppBar(title: const Text('AppBar')),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(title: Text('Place ${index + 1}'));
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
