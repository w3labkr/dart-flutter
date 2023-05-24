import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('page1'),
            onTap: () {
              Navigator.pushNamed(context, '/page1');
            },
            trailing: const Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('page2'),
            onTap: () {
              Navigator.pushNamed(context, '/page2');
            },
            trailing: const Icon(Icons.navigate_next),
          )
        ]),
      ),
      body: const Center(child: Icon(Icons.home)),
    );
  }
}
