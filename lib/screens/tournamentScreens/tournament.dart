import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/animatedLoaders/tournamentLoader.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/model/tournament/tournamentAndEvent.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/screens/noInternet.dart';
import 'package:padelmatchv2/screens/tournamentScreens/americanoInvites.dart';
import 'package:padelmatchv2/screens/tournamentScreens/completed.dart';
import 'package:padelmatchv2/screens/tournamentScreens/invitation.dart';
import 'package:padelmatchv2/screens/tournamentScreens/running.dart';
import 'package:padelmatchv2/screens/tournamentScreens/svenskaPadelTouren.dart';


class Tournament extends StatefulWidget {
  @override
  _TournamentState createState() => _TournamentState();
}

class _TournamentState extends State<Tournament> {
  bool _isLoading = true;
  bool internet;
  var tournamentData;
  @override
  void initState() {
    internetCheck();
    //_getTournamentData();
    super.initState();
  }

  Future _getTournamentData() async {
    // if(store.state.tournamentData !=null){
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   return store.state.tournamentData;
    // }
    var res = await CallApi().getData('tournaments-listing');
    final body = json.decode(res.body);
    
    var data = TournamentAndEvent.fromJson(body);
    store.dispatch(TournamentData(data));
    
    setState(() {
      _isLoading = false;
    });
 }


 void internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        internet = true;
      });
      _getTournamentData();
      return null;
    }
    
    setState(() {
      internet = false;
      _isLoading = false;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    if(_isLoading){
      return Center(
        child:  TournamentLoader(), 
      );
    }
    return  internet ? Container(
      child:  DefaultTabController(
        length: 3,
        child:  Scaffold(
          backgroundColor: Colors.black,
          appBar:  PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child:  Container(
              color: Colors.black,
              child:  SafeArea(
                child: Column(
                  children: <Widget>[
                     Expanded(child:  Container()),
                     TabBar(
                      indicatorColor: Colors.transparent,
                      isScrollable: true,
                      tabs: [
                        Text(
                          FlutterI18n.translate(context, "running"),
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 19.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          FlutterI18n.translate(context, "invitations"),
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 19.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          FlutterI18n.translate(context, "Americano invitations"),
                          //'Americano invitations',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 19.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text(
                        //   'PlayMates',
                        //   textDirection: TextDirection.ltr,
                        //   style: TextStyle(
                        //     fontSize: 19.0,
                        //     decoration: TextDecoration.none,
                        //     fontFamily: 'BebasNeue',
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),


                        // Text(
                        //   'SPT',
                        //   textDirection: TextDirection.ltr,
                        //   style: TextStyle(
                        //     fontSize: 19.0,
                        //     decoration: TextDecoration.none,
                        //     fontFamily: 'BebasNeue',
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // )
                      ],
                    ),
                     Expanded(child:  Container()),
                  ],
                ),
              ),
            ),
          ),
          body:  TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child:  Column(
                  children: _runningLeagues(),
                ),
              ),
               SingleChildScrollView(
                child:  Column(
                  children: _eventInvitation(),
                ),
              ),

              SingleChildScrollView(
                child:  Column(
                  children: _americanoInvitation(),
                ),
              ),

              //  SingleChildScrollView(
              //   child:  Column(
              //     children: <Widget>[
              //       PlayMates(),
              //     ], 
              //   ),
              // ),


              // SingleChildScrollView(
              //   child:  Column(
              //     children: <Widget>[
              //       SvenskaPadelTouren(),
              //     ], 
              //   ),
              // ),

            ],
          ),
        ),
      ),
    ) : NoInternet();
  }

  List<Widget> _runningLeagues(){
      List<Widget> leagues = []; 
      for(var tr in store.state.tournamentData.runningTr){
         leagues.add(Running(tr)); 
      }
      return leagues; 
  }



  List<Widget> _eventInvitation(){
      
      List<Widget> leagues = []; 
      for(var tr in store.state.tournamentData.events){
         leagues.add(Invitationn(tr));
      }
      return leagues;
  }


  List<Widget> _americanoInvitation(){
      
      List<Widget> leagues = []; 
      for(var tr in store.state.tournamentData.americnoInvites){
         leagues.add(AmericanoInvitation(tr));
      }
      return leagues;
  }




}
