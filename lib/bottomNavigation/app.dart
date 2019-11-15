import 'package:flutter/material.dart';
import 'package:padelmatchv2/bottomNavigation/bottom_navigation.dart';
import 'package:padelmatchv2/bottomNavigation/tab_navigator.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  TabItem currentTab = TabItem.home;
  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.tournament: GlobalKey<NavigatorState>(),
    TabItem.settings: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    setState(() {
      currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[currentTab].currentState.maybePop(),
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.tournament),
          _buildOffstageNavigator(TabItem.settings),
        ]),
        bottomNavigationBar: 
        
        new Theme(
        data: Theme.of(context).copyWith(
        // sets the background color of the BottomNavigationBar
        canvasColor: Colors.transparent,
        //backgroundColor: Colors.lightBlue,
        // sets the active color of the BottomNavigationBar if Brightness is light
        primaryColor: Colors.white,
        //disabledColor: Colors.blue,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.white54))
        ),

        child: Container(
          decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      begin: Alignment.centerLeft,
                      end: Alignment.topRight,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.1, 0.4, 0.6, 0.9],
                      colors: [
                        // Colors are easy thanks to Flutter's Colors class.
                        Colors.grey[700],
                        Colors.grey[500],
                        Colors.brown[300],
                        Colors.grey[800],
                      ],
                    ),
                  ),

                  child:  BottomNavigation(
          currentTab: currentTab,
          onSelectTab: _selectTab,
        ),
          // child: new BottomNavigationBar(
          // onTap: onTabTapped,
          // currentIndex: 0,//store.state.bottomNavigationState, // this will be set when a new tab is tapped
          // items: [
          //     BottomNavigationBarItem(
          //       icon: new Icon(Icons.home),
          //       title: new Text('Home'),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: new Icon(Icons.list),
          //       title: new Text('Tournament'),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.settings),
          //       title: Text('Settings'),
          //     ),
             
          //   ],
          // ),
        ),
      ),
       
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
