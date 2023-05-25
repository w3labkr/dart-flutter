import 'package:flutter/material.dart';

enum TabItem { home, chat, event, place, person }

const Map<TabItem, IconData> tabIcons = {
  TabItem.home: Icons.home,
  TabItem.chat: Icons.chat_bubble,
  TabItem.event: Icons.event,
  TabItem.place: Icons.place,
  TabItem.person: Icons.person,
};

const Map<TabItem, Widget> tabScreens = {
  TabItem.home: Center(child: Icon(Icons.home)),
  TabItem.chat: Center(child: Icon(Icons.chat_bubble)),
  TabItem.event: Center(child: Icon(Icons.event)),
  TabItem.place: Center(child: Icon(Icons.place)),
  TabItem.person: Center(child: Icon(Icons.person)),
};

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => tabScreens[tabItem]!,
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
