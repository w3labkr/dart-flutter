import 'package:flutter/material.dart';

class SilverGridScreen extends StatefulWidget {
  const SilverGridScreen({Key? key}) : super(key: key);

  @override
  State<SilverGridScreen> createState() => _SilverGridScreenState();
}

class _SilverGridScreenState extends State<SilverGridScreen> {
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
              title: const Text('AppBar'),
              background:
                  Image.asset('assets/images/one.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(title: Text('$index'));
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
