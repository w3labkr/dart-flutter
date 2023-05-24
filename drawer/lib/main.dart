import 'package:flutter/material.dart';

import 'main_page.dart';
import 'page1.dart';
import 'page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
      },
    );
  }
}
