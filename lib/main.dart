import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/screens/americano/americanoScreen.dart';
import 'package:padelmatchv2/screens/divResult/divAddEditResult.dart';
import 'package:padelmatchv2/screens/divranks/DivRankHomePage.dart';
import 'package:padelmatchv2/screens/eventDetailsScreen/eventDetails.dart';
import 'package:padelmatchv2/screens/noInternet.dart';
import 'package:padelmatchv2/screens/player/playerStatsScreen.dart';
import 'package:padelmatchv2/screens/rankDetails/rankDetailScreen.dart';
import 'package:padelmatchv2/screens/season/seasonScreen.dart';
import 'package:padelmatchv2/screens/team/teamStatsScreen.dart';
import 'package:padelmatchv2/standing/matches/matches.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluro/fluro.dart';
import 'dart:io' show Platform;
// import all screens
import 'package:padelmatchv2/screens/home.dart';
import 'package:padelmatchv2/screens/login.dart';
import 'package:launch_review/launch_review.dart'; 
// end of screen imports

// import redux

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'redux/state.dart';
import 'redux/reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'redux/thunk.dart';

///firebase
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

// INITIALIZE THE REDUX STORE WITH INITIAL VALUE...

final store = Store<AppState>(reducer,
    initialState: AppState(
        demoState: "PlayBook",
        myMatches: [],
        divMatches: [],
        divRank: [],
        bottomNavigationState: 0,
        isEmail: true,
        isPin: false,
        isReset: false),
    middleware: [thunkMiddleware]);

Future main() async{
  Router router = new Router();
  router.define('/', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HomePage();
  }));
  router.define('/login', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new Login();
  }));
  router.define('/home', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new Home();
  }));

  router.define('/matches/:id', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new Matches(params["id"][0]);
  }));

  // MAIN RANKING PAGE
  router.define('/divrank/:divId/:trId', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new DivRankHomePage(params["divId"][0], params["trId"][0]);
  }));

  // ADD DIVISIONS RESULTS
  router.define('/divresult/:match', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return EnterResult(params["match"][0]);
  }));

  // ADD DIVISIONS RESULTS
  router.define('/rankDetails', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return RankDetailsScreen();
  }));

  // ADD DIVISIONS RESULTS
  router.define('/teamStates/:teamId', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return TeamStatesData(params["teamId"][0]);
  }));

  // ADD DIVISIONS RESULTS
  router.define('/playerStates/:playerId', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return PlayerStatesData(params["playerId"][0]);
  }));

  // ADD DIVISIONS RESULTS
  router.define('/eventDetails/:id', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return EventDetails(params["id"][0]);
  }));

  // ADD DIVISIONS RESULTS
  // router.define('/season/:id', handler: new Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //   return Season(params["id"][0]);
  // }));

  // ADD DIVISIONS RESULTS
  // router.define('/americano/:trId', handler: new Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //   return AmericanoScreen(params["trId"][0]);
  // }));

  router.define('/enterresult', handler: new Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return EnterResult(params["match"][0]);
  }));

  //  // ADD DIVISIONS RESULTS
  // router.define('/registration', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  //   return  Registration();
  // }));

  // Run app from splash page!\
  WidgetsFlutterBinding.ensureInitialized(); 
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var defaultLocal = 'en';
  var localCode =  localStorage.getString('localCode');
   if(localCode!=null){
      defaultLocal = localCode;
   }

  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
      useCountryCode: false,
      fallbackFile: 'en',
      path: 'assets/i18n',
      forcedLocale: new Locale(defaultLocal));
  
  await flutterI18nDelegate.load(null);
  
  runApp(new MyApp(flutterI18nDelegate));
 // runApp(MyApp());
}


class MyApp extends StatefulWidget {
  
  FlutterI18nDelegate flutterI18nDelegate;

  MyApp(this.flutterI18nDelegate);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.00),
          );
        },
        title: 'forehand',
        home: new HomePage(),
        localizationsDelegates: [
        widget.flutterI18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
        theme: ThemeData(
          canvasColor: Colors.grey[700],
          unselectedWidgetColor: Colors.white,
          disabledColor: Colors.grey,
          //brightness: Brightness.dark
          //         pageTransitionsTheme: PageTransitionsTheme(
          //   builders: {
          //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          //   }
          // )
        ),
        debugShowCheckedModeBanner: false,
        // onGenerateRoute: router.generator // Use our Fluro routers for this app.
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoggedin = false;
  bool isLoading = true;
  bool isNewVersionAvailble = false;
  bool isCheckingVersion = true;
  var msg;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    // check if token is set or not...
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    // get the version check
    var res = await CallApi().getData('check-new-version');
    var body = json.decode(res.body);

    if (body['isNewVersionAvailble']) {
      msg = body['msg'];
      isNewVersionAvailble = true;
    }

    if (token == null) {
      // user is not logged in....
      setState(() {
        isLoading = false;
      });
    } else {
      // call database with the given token to re validate...

      // var res = await CallApi().getData('user?token=$token');
      // var user = json.decode(res.body);
      // localStorage.setString('user', json.encode(user));
      // var userinfo = localStorage.getString('user');
      // var dec = json.decode(userinfo);
      // print(dec['id']);

      setState(() {
        _isLoggedin = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Container(
        child: isNewVersionAvailble
            ? UpdateScreen(msg)
            : Scaffold(
                body: StoreConnector<AppState, AppState>(
                    converter: (store) => store.state,
                    builder: (context, items) =>
                        _isLoggedin ? Navigation() : Login())),
      );
    }
  }
}

//////// Update Screen////

class UpdateScreen extends StatelessWidget {
  var msg; 
  UpdateScreen(this.msg);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              color: Colors.black.withOpacity(.5),
            ),
          ],
          color: Colors.grey[850],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Center(
                child: Container(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset('assets/img/update.png', color: Colors.white,)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text("$msg",
                textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                          ),
                    )),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      onPressed: (){
                          goToStore();
                      },
                      child: Text(
                        FlutterI18n.translate(context, "Update"),
                        //"Update",
                textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  void goToStore(){
       if (Platform.isAndroid) {
        // Android-specific code
        print('android');
      } else if (Platform.isIOS) {
         LaunchReview.launch(writeReview: false,iOSAppId: "1465586505");
      }
  }

}
