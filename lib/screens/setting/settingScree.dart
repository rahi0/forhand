import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/screens/changeEmailScreen/changeEmailScreen.dart';
import 'package:padelmatchv2/screens/changePasswordScreen/changePassword.dart';
import 'package:padelmatchv2/screens/clubList/joinClubList.dart';
import 'package:padelmatchv2/screens/clubList/myClubList.dart';
import 'package:padelmatchv2/screens/createTeamScreen/createTeam.dart';
import 'package:padelmatchv2/screens/home.dart';
import 'package:padelmatchv2/screens/languageScreen/languagePage.dart';
import 'package:padelmatchv2/screens/login.dart';
import 'package:padelmatchv2/screens/noInternet.dart';
import 'package:padelmatchv2/screens/passwordreset/passwordResetScreen.dart';
import 'package:padelmatchv2/screens/player/playerStatsScreen.dart';
import 'package:padelmatchv2/screens/registrationScreen/registration.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/teamList/teamListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  
  @override
  _SettingsState createState() => _SettingsState();
}

Future navigateToSubPage(context) async {
  print('message');
}

class _SettingsState extends State<Settings> {
  var userData;
  ScaffoldState scaffoldState;
  bool internet = true;
  
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: FlutterI18n.translate(context, "Close"),
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
   }

   @override
  void initState() {
    //_getUser();
    internetCheck();
    super.initState();
  }


  void internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        internet = true;
      });
      _getUser();
      return null;
    }
    
    setState(() {
      internet = false;
    });
}

  void _getUser() async {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var userJson = localStorage.getString('user');
      var user = json.decode(userJson);
      setState(() {
          userData = user;
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          title: Text(
            FlutterI18n.translate(context, "Settings"),
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 21.0,
              decoration: TextDecoration.none,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: internet ? SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///////////Profile Button//////////

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, SlideLeftRoute(page: PlayerStatesData(userData['id'])));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: ClipOval(
                              child: userData!= null ? Image.network(
                                CallApi().baseUrl+'${userData['profilePic']}',
                                height: 70,
                                width: 70,
                              )
                              :Image.asset(
                                'assets/img/d.jpg',
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                      userData!= null ? '${userData['firstName']} ${userData['lastName']}' : '',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'BebasNeue',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                                  child: Text(
                                    userData!= null ? 'ID : ${userData['id']}' : '',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),

            ///////////Profile Button end//////////

            Container(
              width: MediaQuery.of(context).size.width,
              height: 0.5,
            ),


            ///////////My Team Button//////////
            GestureDetector(
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: MyTeams()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.group,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                FlutterI18n.translate(context, "My Teams"),
                                //'My Teams',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),

            ///////////My Team Button//////////

            Container(width: MediaQuery.of(context).size.width, height: 0.5),




            ///////////My Club Button//////////
            // GestureDetector(
            //     onTap: () {
            //       Navigator.push(context, SlideLeftRoute(page: MyClubList()));
            //     },
            //     child: Container(
            //       width: MediaQuery.of(context).size.width,
            //       padding:
            //           EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            //       color: Colors.black,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Container(
            //             child: Row(
            //               children: <Widget>[
            //                 Container(
            //                   margin: EdgeInsets.only(right: 10),
            //                   child: Icon(
            //                     Icons.all_inclusive,
            //                     color: Colors.white,
            //                   ),
            //                 ),
            //                 Container(
            //                   alignment: Alignment.centerLeft,
            //                   child: Text(
            //                     'My Club',
            //                     textDirection: TextDirection.ltr,
            //                     style: TextStyle(
            //                       letterSpacing: 0.5,
            //                       wordSpacing: 1,
            //                       color: Colors.white,
            //                       fontSize: 17.0,
            //                       decoration: TextDecoration.none,
            //                       fontFamily: 'BebasNeue',
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Container(
            //             child: Icon(
            //               Icons.keyboard_arrow_right,
            //               color: Colors.white,
            //             ),
            //           )
            //         ],
            //       ),
            //     )),

            ///////////My Club Button//////////

            //Container(width: MediaQuery.of(context).size.width, height: 0.5),



            ///////////Create Team Button//////////
            // GestureDetector(
            //     onTap: () {
            //       Navigator.push(context, SlideLeftRoute(page: CreateTeam()));
            //     },
            //     child: Container(
            //       width: MediaQuery.of(context).size.width,
            //       padding:
            //           EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            //       color: Colors.black,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Container(
            //             child: Row(
            //               children: <Widget>[
            //                 Container(
            //                   margin: EdgeInsets.only(right: 10),
            //                   child: Icon(
            //                     Icons.cake,
            //                     color: Colors.white,
            //                   ),
            //                 ),
            //                 Container(
            //                   alignment: Alignment.centerLeft,
            //                   child: Text(
            //                     'Create Teams',
            //                     textDirection: TextDirection.ltr,
            //                     style: TextStyle(
            //                       letterSpacing: 0.5,
            //                       wordSpacing: 1,
            //                       color: Colors.white,
            //                       fontSize: 17.0,
            //                       decoration: TextDecoration.none,
            //                       fontFamily: 'BebasNeue',
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Container(
            //             child: Icon(
            //               Icons.keyboard_arrow_right,
            //               color: Colors.white,
            //             ),
            //           )
            //         ],
            //       ),
            //     )),

            ///////////Create Team Button//////////

            //Container(width: MediaQuery.of(context).size.width, height: 0.5),


            ///////////Join Club Button//////////
            // GestureDetector(
            //     onTap: () {
            //       Navigator.push(context, SlideLeftRoute(page: JoinClubList()));
            //     },
            //     child: Container(
            //       width: MediaQuery.of(context).size.width,
            //       padding:
            //           EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            //       color: Colors.black,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Container(
            //             child: Row(
            //               children: <Widget>[
            //                 Container(
            //                   margin: EdgeInsets.only(right: 10),
            //                   child: Icon(
            //                     Icons.playlist_play,
            //                     color: Colors.white,
            //                   ),
            //                 ),
            //                 Container(
            //                   alignment: Alignment.centerLeft,
            //                   child: Text(
            //                     'Join Club',
            //                     textDirection: TextDirection.ltr,
            //                     style: TextStyle(
            //                       letterSpacing: 0.5,
            //                       wordSpacing: 1,
            //                       color: Colors.white,
            //                       fontSize: 17.0,
            //                       decoration: TextDecoration.none,
            //                       fontFamily: 'BebasNeue',
            //                       fontWeight: FontWeight.bold,
            //                     ),
            //                   ),
            //                 )
            //               ],
            //             ),
            //           ),
            //           Container(
            //             child: Icon(
            //               Icons.keyboard_arrow_right,
            //               color: Colors.white,
            //             ),
            //           )
            //         ],
            //       ),
            //     )),

            ///////////Join Club Button//////////

            Container(width: MediaQuery.of(context).size.width, height: 0.5),

            ///////////Edit Profile Button//////////
            GestureDetector(
                onTap: () {
                 Navigator.push(context, SlideLeftRoute(page: Registration(userData))).then((_) {
                       print('this is called');
                        _getUser();
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                FlutterI18n.translate(context, "Edit Profile"),
                                //'Edit Profile',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),

            ///////////Edit Profile Button//////////

            Container(width: MediaQuery.of(context).size.width, height: 0.5),

            ///////////Change Language Button//////////

            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, SlideLeftRoute(page: LanguagePage()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.language,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                FlutterI18n.translate(context, "Change Language"),
                               // 'Change Language',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),

            ///////////Change Language Button end//////////

            Container(width: MediaQuery.of(context).size.width, height: 0.5),


            ///////////Change Email Button//////////
            GestureDetector(
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: ChangeEmail(userData)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                 FlutterI18n.translate(context, "Change Email"),
                                //'Change Email',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),

            ///////////Change Email Button//////////

            Container(width: MediaQuery.of(context).size.width, height: 0.5),

            ///////////Reset Password Button//////////

            GestureDetector(
                onTap: () {
                  //Navigator.of(context).pushNamed("/ChangePassword");
                  Navigator.push(
                      context, SlideLeftRoute(page: ChangePassword()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.vpn_key,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                FlutterI18n.translate(context, "Change Password"),
                                //'Change Password',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),

            ///////////Reset Password Button end//////////

            Container(width: MediaQuery.of(context).size.width, height: 0.5),


            

            ///////////LogOut Button//////////

            GestureDetector(
                onTap: () {
                  _logout();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.exit_to_app,
                          color: Colors.grey[600],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          FlutterI18n.translate(context, "Logout"),
                          //'Logout',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.red[400],
                            fontSize: 17.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
            ///////////LogOut Button end//////////
          ],
        ),
      ),
      ) : NoInternet()
    ));
  }

  // logout the user 
  _logout() async{
      var res = await CallApi().getData('logout');
      var body = json.decode(res.body);
      // RESET THE DATA BACK TO EMPTY ONCE USER LOGGED OUT 
      
      //store.dispatch(HomePageData(null));
      if(body['success']){
         _showMsg(body['message']);
          SharedPreferences localStorage = await SharedPreferences.getInstance();
          localStorage.remove('token');
          localStorage.remove('user');
        Navigator.push(
          context, SlideRightRoute(page: Login())
        );
       
      }else{
        _showMsg(body['message']);
      }
  }
}
