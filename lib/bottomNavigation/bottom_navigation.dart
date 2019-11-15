import 'package:flutter/material.dart';

enum TabItem { home, tournament, settings }

class TabHelper {
  static TabItem item({int index}) {
    switch (index) {
      case 0:
        return TabItem.home;
      case 1:
        return TabItem.tournament;
      case 2:
        return TabItem.settings;
    }
    return TabItem.home;
  }

  static String description(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.home:
        return 'Home';
      case TabItem.tournament:
        return 'Tournament';
      case TabItem.settings:
        return 'Settings';
    }
    return '';
  }

  static IconData icon(TabItem tabItem) {
    switch (tabItem) {
      case TabItem.home:
        return Icons.home;
      case TabItem.tournament:
        return Icons.list;
      case TabItem.settings:
        return Icons.settings;
    }
    return Icons.layers;
  }

  static MaterialColor color(TabItem tabItem) {

    // switch (tabItem) {
    //   case TabItem.home:
    //     return Colors.white;
    //   case TabItem.tournament:
    //     return Colors.white;
    //   case TabItem.settings:
    //     return Colors.white;
    // }
    return Colors.blue;
  }
}

class BottomNavigation extends StatefulWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  BottomNavigation({this.currentTab, this.onSelectTab});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      //fixedColor: Colors.white,
      items: [
        _buildItem(tabItem: TabItem.home),
        _buildItem(tabItem: TabItem.tournament),
        _buildItem(tabItem: TabItem.settings),
      ],
      onTap: (index) => widget.onSelectTab(
            TabHelper.item(index: index),
          ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = TabHelper.description(tabItem);
    IconData icon = TabHelper.icon(tabItem);
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return widget.currentTab == item ?
    Colors.white : Colors.grey; 
    //TabHelper.color(item) : Colors.grey;
  }
}
