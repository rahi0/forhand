import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/animatedLoaders/homeLoader.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/bottomNavigation/app.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/model/upcomingmatch/upcomingmatch.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/redux/thunk.dart';
import 'package:padelmatchv2/screens/noInternet.dart';
import 'package:padelmatchv2/screens/notificationScreen/notificationScreen.dart';
import 'package:padelmatchv2/screens/player/playerStatsScreen.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/setting/settingScree.dart';
import 'package:padelmatchv2/screens/tournamentScreens/tournament.dart';
import 'package:padelmatchv2/screens/updateAppScreen.dart';
import 'package:padelmatchv2/screens/widgets/home/UpcomeingEventCard.dart';
import 'package:padelmatchv2/screens/widgets/home/current_stand.dart';
import 'package:padelmatchv2/screens/widgets/home/homePageTop.dart';
import 'package:padelmatchv2/screens/widgets/home/mainbody.dart';
import 'package:padelmatchv2/screens/widgets/home/upcomeingAmericanoCard.dart';
import 'package:padelmatchv2/screens/widgets/home/upcomingmatchescard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///firebase
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;
  bool internet = true;
  int uid;
  String firstName;
  String teamName;
  var userData;
  bool isSuccess = true;
  String msg = '';

  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final RefreshController _refreshController = RefreshController();
  @override
  void initState() {
    _getUser();
    internetCheck();
    firebaseCloudMessaging_Listeners();
    super.initState();
  }

  void firebaseCloudMessaging_Listeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token) {
      print('token is');
      print(token);
      updateToken(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  updateToken(token) async {
    if(!internet) return;
    CallApi().postData({'appToken': token}, 'update-app-token');
  }

  void _getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });
  }
  internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi) {
      setState(() {
        internet = false;
        isLoading = false;
      });
     return;
    }
    _getHomeData();
    
   
}

  _getHomeData() async {
    // DON'T BRING THE DATA IF THE DATE EXISTS SO REUSE THEM..
    // if(store.state.homePageData !=null){
     
    //   setState(() {
    //     isLoading = false;
    //   });
    //   return store.state.homePageData;

    // }
    // print('api is being called');
    var res = await CallApi().getData('upcoming-matches');
    final body = json.decode(res.body);
    var homePageData;
    if (body != null) {
      homePageData = MainData.fromJson(body);
    }
    print('this was called');
    store.dispatch(HomePageData(homePageData)); // update data in store...
    setState(() {
      isLoading = false;
    });
    //return store.state.homePageData;
  }

  Widget build(BuildContext context) {
    return !internet ? NoInternet()  : Container(
      color: Colors.black,
      child:  SafeArea(
        bottom: false,
        child: new Scaffold(
          //appBar: AppBar(backgroundColor: Colors.black,),
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.black,
          body: isLoading
              ? HomePageLoader()
              :  Container(
                  child: store.state.homePageData == null
                      ? Container(
                          child: Text(FlutterI18n.translate(context, "there is no data to show"),),
                        )
                      : Container(
                          child: Container(
                            //             SmartRefresher(
                            // controller: _refreshController,
                            // enablePullDown: true,
                            // header: WaterDropMaterialHeader(color: Colors.black, backgroundColor: Colors.white,),
                            // onRefresh: () async {
                            //   await _getHomeData();
                            //   _refreshController.refreshCompleted();
                            // },

                            //   child: CustomScrollView(
                            //   slivers: <Widget>[
                            //     HomeTopBar(userData),
                            //     SliverList(
                            //       delegate: SliverChildBuilderDelegate(
                            //         (BuildContext context, int index) {
                            //            return CurrentStand(res.data.currentDivs, index);
                            //         },
                            //         childCount: res.data.currentDivs.length,
                            //       ),
                            //     ),

                            //     ////////fake Cards start//////////

                            //     // SliverList(
                            //     //   delegate: SliverChildBuilderDelegate(
                            //     //     (BuildContext context, int index) {
                            //     //        return BookingCard();
                            //     //     },

                            //     //     childCount: 1,
                            //     //   ),
                            //     // ),
                            //     // SliverList(
                            //     //   delegate: SliverChildBuilderDelegate(
                            //     //     (BuildContext context, int index) {
                            //     //        return PracticeCard();
                            //     //     },

                            //     //     childCount: 1,
                            //     //   ),
                            //     // ),

                            //     ////////fake Cards End//////////

                            //     SliverList(
                            //       delegate: SliverChildBuilderDelegate(
                            //         (BuildContext context, int index) {

                            //            if(res.data.matches[index].cardType=='division'){
                            //              return UpcomingMatchesCard(res.data.matches, index);
                            //            }
                            //            if(res.data.matches[index].cardType=='event'){
                            //               print(res.data.matches[index].singedupCount);
                            //               return UpcomingEventCard(res.data.matches, index);
                            //            }
                            //            if(res.data.matches[index].cardType=='americano'){
                            //               return UpcomingAmericanoCard(res.data.matches, index);
                            //            }

                            //         },
                            //         // Or, uncomment the following line:
                            //         childCount: res.data.matches.length,
                            //       ),
                            //     ),

                            //   ],
                            // ),
                            child: new NestedScrollView(
                                headerSliverBuilder: (BuildContext context,
                                    bool innerBoxIsScrolled) {
                                  return <Widget>[HomeTopBar(userData)];
                                },
                                body: !store.state.homePageData.success
                                    ? Container(
                                        //color: Colors.red,
                                        alignment: Alignment.center,
                                        height:
                                            MediaQuery.of(context).size.height,
                                        padding: EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Text(
                                          '${store.state.homePageData.msg}',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    : MainBody(store.state.homePageData)),
                          ),
                        ),
                ),
        ),
      ),
    );
  }
}

// final List<Widget> children = [
//   Home(),
//   Tournament(),
//   Settings(),
// ];

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation>
    with SingleTickerProviderStateMixin {
  final List<Widget> _children = [
    Home(),
    Tournament(),
    Settings(),
    NotificationPage()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: //App()
          _children[_currentIndex],
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the BottomNavigationBar
            canvasColor: Colors.transparent,
            //backgroundColor: Colors.lightBlue,
            // sets the active color of the BottomNavigationBar if Brightness is light
            primaryColor: Colors.white,
            //disabledColor: Colors.blue,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white54))),
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
          child: new BottomNavigationBar(
            // type: BottomNavigationBarType.fixed ,
            onTap: onTabTapped,
            currentIndex:
                _currentIndex, //store.state.bottomNavigationState, // this will be set when a new tab is tapped
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text(FlutterI18n.translate(context, "Home")),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.list),
                title: new Text(FlutterI18n.translate(context, "Tournament")),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text(FlutterI18n.translate(context, "Settings")),
              ),
              BottomNavigationBarItem(
                icon: Stack(children: <Widget>[
                  Icon(Icons.notifications),
                  //   Positioned(  // draw a red marble
                  //   top: 0.0,
                  //   right: 2.0,
                  //   child: Container(
                  //     alignment: Alignment.center,
                  //     padding: EdgeInsets.all(1),
                  //     decoration: BoxDecoration(
                  //       color: Colors.red,
                  //       borderRadius: BorderRadius.circular(20)
                  //     ),
                  //     child: Text('79', style: TextStyle(color: Colors.white),),
                  //   )
                  // )
                ]),
                title: Text(FlutterI18n.translate(context, "Notification")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
