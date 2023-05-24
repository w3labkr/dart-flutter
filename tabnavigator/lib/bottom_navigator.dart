import 'package:flutter/material.dart';
import 'package:tabnavigator/tab_navigator.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator(
      {super.key, required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _buildItem(TabItem.home),
        _buildItem(TabItem.chat),
        _buildItem(TabItem.event),
        _buildItem(TabItem.place),
        _buildItem(TabItem.person),
      ],
      onTap: (index) => onSelectTab(TabItem.values[index]),
      currentIndex: currentTab.index,
      selectedItemColor: Colors.red,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(tabIcons[tabItem]),
      label: tabItem.name,
    );
  }
}
