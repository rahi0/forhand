import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/animatedLoaders/PlayerProfileLoader.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/model/player/playerStats.dart';
import 'package:padelmatchv2/screens/registrationScreen/registration.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/team/teamStatsScreen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class PlayerStatesData extends StatefulWidget {
  final playerId;
  PlayerStatesData(this.playerId);
  @override
  _PlayerStatesDataState createState() => _PlayerStatesDataState();
}

class _PlayerStatesDataState extends State<PlayerStatesData> {
  bool _isLoading = true;
  var playerData;
  @override
  void initState() {
    print(widget.playerId);
    _getPlayerData();
    super.initState();
  }

  Future _getPlayerData() async {
    var res = await CallApi().getData('player-stats/${widget.playerId}');
    final body = json.decode(res.body);
    var data = PlayerStats.fromJson(body);
    setState(() {
      playerData = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: PlayerProfileLoader(),
      );
    }
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,

            child: Column(
              children: <Widget>[
                Container(
                    // constraints: new BoxConstraints.expand(
                    //   height: 214.0,
                    // ),
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 0.0, bottom: 8.0, top: 40),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        // Where the linear gradient begins and ends
                        begin: Alignment.centerLeft,
                        end: Alignment.topRight,
                        // Add one stop for each color. Stops should increase from 0 to 1
                        stops: [0.1, 0.4, 0.6, 0.9],
                        colors: [
                          // Colors are easy thanks to Flutter's Colors class.
                          Colors.grey[900],
                          Colors.brown[800],
                          Colors.brown[600],
                          Colors.grey[700],
                        ],
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      //padding: EdgeInsets.only(top: 3, left: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          //////////Name & pic////////
                          Container(
                            //decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white30, width: 0.5))),
                            alignment: Alignment.centerLeft,
                            //padding: EdgeInsets.only(bottom: 33),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(left: 3, top: 3),
                                  child: BackButton(
                                    color: Colors.white,
                                  ),
                                ),

                                //////////Clubs Icon///////
                                Container(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: _clubLogo()
                                  ),

                                ),

                                /////////Clubs Icon end///////
                                

                                Container(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(width: 20,),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(3, 7, 3, 3),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1.5
                                          ),
                                          borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Text(
                                          FlutterI18n.translate(context, "No ranking"),
                                                //'No ranking',
                                                textDirection: TextDirection.ltr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 19.0,
                                                  decoration: TextDecoration.none,
                                                  fontFamily: 'BebasNeue',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                      ),

                                      
                                    ],
                                  ),
                                ),
                                

                                ///////// Pic Name Rank ///////
                                
                                Container(
                                  //color: Colors.yellow,
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[

                                      Container(
                                        //color: Colors.red,
                                        padding: EdgeInsets.only(left: 10),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                        padding: EdgeInsets.only(bottom: 15.0,),
                                        margin: EdgeInsets.only(right: 20),
                                        //height: 80,
                                        //width: 80,
                                        // color: Colors.blue,
                                        child: ClipOval(
                                          child: playerData.player.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${playerData.player.profilePic}',
                                                          height: 110,
                                                          width: 110,
                                                        )
                                           :Image.asset(
                                            'assets/img/b.jpg',
                                            height: 110,
                                            width: 110,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                            Container(
                                              margin: EdgeInsets.only(top: 10, right: 2),
                                              //color: Colors.blue,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                              //color: Colors.red,
                                              width: 190,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '${playerData.player.firstName} ${playerData.player.lastName}',
                                                textDirection: TextDirection.ltr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  decoration: TextDecoration.none,
                                                  fontFamily: 'BebasNeue',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 100,
                                              alignment: Alignment.centerLeft,
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(
                                                '${playerData.player.dob}',
                                                textDirection: TextDirection.ltr,
                                                style: TextStyle(
                                                  color: Colors.white54,
                                                  fontSize: 15.0,
                                                  decoration: TextDecoration.none,
                                                  fontFamily: 'BebasNeue',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),


                                            Container(
                                              padding: EdgeInsets.only(top: 10),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          'assets/img/logo.png',
                                          height: 50,
                                          width: 50,
                                          color: Colors.white,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                ////////Pic Name Rank end///////
                                


                                ///////////Sport start//////////
                                
                                // Container(
                                //   color: Colors.indigo,
                                //   width: MediaQuery.of(context).size.width,
                                //   padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                // ),
                                //////////////Sport end//////////
                                


                                ////////Win History////////
                                
                                // Container(
                                //   //color: Colors.red,
                                //   padding: EdgeInsets.only(top: 15, bottom: 15),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: <Widget>[
                                //       Container(
                                //         margin: EdgeInsets.only(right: 3),
                                //         child: Icon(
                                //           Icons.radio_button_checked,
                                //           color: Colors.red[300],
                                //           size: 18,
                                //         ),
                                //       ),
                                //       Container(
                                //         margin: EdgeInsets.only(right: 3),
                                //         child: Icon(
                                //           Icons.radio_button_checked,
                                //           color: Colors.red[300],
                                //           size: 18,
                                //         ),
                                //       ),
                                //       Container(
                                //         margin: EdgeInsets.only(right: 3),
                                //         child: Icon(
                                //           Icons.radio_button_checked,
                                //           color: Colors.teal,
                                //           size: 18,
                                //         ),
                                //       ),
                                //       Container(
                                //         margin: EdgeInsets.only(right: 3),
                                //         child: Icon(
                                //           Icons.radio_button_checked,
                                //           color: Colors.teal,
                                //           size: 18,
                                //         ),
                                //       ),
                                //       Container(
                                //         margin: EdgeInsets.only(right: 3),
                                //         child: Icon(
                                //           Icons.radio_button_checked,
                                //           color: Colors.teal,
                                //           size: 18,
                                //         ),
                                //       ),
                                //       Container(
                                //         margin: EdgeInsets.only(right: 3),
                                //         child: Icon(
                                //           Icons.radio_button_checked,
                                //           color: Colors.teal,
                                //           size: 18,
                                //         ),
                                //       ),
                                //       Container(
                                //         margin: EdgeInsets.only(right: 3),
                                //         child: Icon(
                                //           Icons.radio_button_checked,
                                //           color: Colors.teal,
                                //           size: 18,
                                //         ),
                                //       ),
                                      
                                //     ],
                                //   ),
                                // ),


                                ////////Win History end////////
                                

                                /////////GAme History///////////
                                

                                Container(
                  padding: EdgeInsets.only(bottom: 3, top: 3, left: 10, right: 10),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  //height: 100,
                  //color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                     ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        //color: Colors.red,
                        height: 70,
                        width: 50,
                        //margin: EdgeInsets.only(left: 30),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              //padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                              alignment: Alignment.center,
                              child: Text(
                                FlutterI18n.translate(context, "matches"),
                                //'matches',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              //padding: EdgeInsets.fromLTRB(25.0, 0.0, 15.0, 10.0),
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              child: Text(
                                '${playerData.totalMatches}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        //color: Colors.red,
                        height: 70,
                        width: 50,
                        margin: EdgeInsets.only(left: 35),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              //padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                              alignment: Alignment.center,
                              child: Text(
                                FlutterI18n.translate(context, "wins"),
                                //'wins',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              //padding: EdgeInsets.fromLTRB(25.0, 0.0, 15.0, 10.0),
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              child: Text(
                                '${playerData.totalWon}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        //color: Colors.red,
                        height: 70,
                        width: 50,
                        margin: EdgeInsets.only(left: 35),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              //padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                              alignment: Alignment.center,
                              child: Text(
                                FlutterI18n.translate(context, "draws"),
                                //'draws',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              //padding: EdgeInsets.fromLTRB(25.0, 0.0, 15.0, 10.0),
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              child: Text(
                                '${playerData.totalDraw}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        //color: Colors.red,
                        height: 70,
                        width: 50,
                        margin: EdgeInsets.only(left: 35),
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                              alignment: Alignment.center,
                              child: Text(
                                FlutterI18n.translate(context, "losses"),
                                //'losses',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white54,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              //padding: EdgeInsets.fromLTRB(25.0, 0.0, 15.0, 10.0),
                              margin: EdgeInsets.only(top: 5),
                              alignment: Alignment.center,
                              child: Text(
                                '${playerData.totalLoss}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                                /////////GAme History end///////////
         
                              ],
                            ),
                          ),

                          //////////Name & pic end////////
                          

                          ///////////Contacts////////
                          Container(
                            //color: Colors.red,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[


                                ///////////Mobile start//////////
                                GestureDetector(
                                  onTap: () {
                                            UrlLauncher.launch("tel:${playerData.player.phone}");
                                            //UrlLauncher.launch("sms:${playerData.player.phone}");
                                            
                                          },
                                    child: Container(
                                    height: 40,
                                    child:  playerData.canSee ?  Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.call,
                                            color: Colors.white30,
                                            size: 18,
                                          ),
                                        ),
                                       Container(
                                          child: Text(
                                            '${playerData.player.phone == null ? '--' : playerData.player.phone}',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 15.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ) : Row(),
                                  ),
                                ),

                                ///////////Mobile end//////////
                                

                                ///////////Email start////////////

                                GestureDetector(
                                  onTap: () {
                                             UrlLauncher.launch('mailto:${playerData.player.email}');
                                           
                                          },
                                  child: Container(
                                    height: 40,
                                    margin: EdgeInsets.only(right: 10),
                                    child: playerData.canSee ? Row(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.mail_outline,
                                            color: Colors.white30,
                                            size: 18,
                                          ),
                                        ),
                                         Container(
                                          child: Text(
                                            '${playerData.player.email}',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 15.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ) : Row(),
                                  ),
                                ),

                                ///////////Email end////////////
                              ],
                            ),
                          )

                          ///////////Contacts end////////
                        ],
                      ),
                    )),

                ////////////////CONTAINER BUTTON///////////////////

                
                //////////////// ROUND BOX1///////////////////

                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  alignment: Alignment.center,
                  width: 500,
                  //height: 100,
                  //color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 500,
                        //height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.0),
                                topRight: Radius.circular(6.0))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  EdgeInsets.fromLTRB(15.0, 15.0, 1.0, 12.0),
                              child: Text(
                                FlutterI18n.translate(context, "teams associated"),
                                //'teams associated',
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
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _allTeams()),
                      )
                    ],
                  ),
                ),

                //////////////// ROUND BOX2///////////////////

                //////////////// ROUND BOX5///////////////////

                Container(
                  margin: EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 120),
                  alignment: Alignment.center,
                  width: 500,
                  //height: 100,
                  //color: Colors.grey,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: 500,
                        //height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6.0),
                                topRight: Radius.circular(6.0))),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 1.0, 12.0),
                          child: Text(
                            FlutterI18n.translate(context, "sports"),
                            //'sports',
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
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: _playingIn(),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),

        //////////////// BOTTOM APP BAR///////////////////

        //////////////// BOTTOM APP BAR END///////////////////
      ),
    );
  }

  List<Widget> _playingIn() {
    List<Widget> playingSports = [];
    if (playerData.isDivPlaying) {
      playingSports.add(
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 25),
          child: Row(
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.brightness_1,
                  color: Colors.white,
                  size: 7,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.fromLTRB(10.0, 15.0, 1.0, 12.0),
                child: Text(
                  //'Division padel',
                  FlutterI18n.translate(context, "Division padel"),
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (playerData.isAmericanoPlaying) {
      playingSports.add(Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 25),
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(
                Icons.brightness_1,
                color: Colors.white,
                size: 7,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(10.0, 15.0, 1.0, 12.0),
              child: Text(
                //'Americano',
                FlutterI18n.translate(context, "Americano"),
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ));
    }

    return playingSports;
  }

List<Widget> _clubLogo(){
  List<Widget> logos = [];
  for(var l in playerData.myClub){
      logos.add(
         Container(
            alignment: Alignment.center,
            child: l.club.logo != null ? Image.network(
                        CallApi().baseUrl+'${l.club.logo}',
                        height: 85,
                        width: 85,
                      )
                :Image.asset( 
              'assets/img/g4.png',
              height: 75,
              width: 75,
              // color: Colors.white,
              fit: BoxFit.cover,
            ),
          )
      );
  }


   return logos;
}


  List<Widget> _allTeams() {
    List<Widget> teams = [];
    for (var t in playerData.team) {
      var otherPlayerName = '';
      var otherPlayerPic = '';
      if (t.player1.firstName == playerData.player.firstName) {
        otherPlayerName = '${t.player2.firstName} ${t.player2.lastName}';
        otherPlayerPic = '${t.player2.profilePic}';
      } else {
        otherPlayerName = '${t.player1.firstName} ${t.player1.lastName}';
        otherPlayerPic = '${t.player1.profilePic}';
      }

      teams.add(GestureDetector(
        onTap: () {
          //Navigator.of(context).pushNamed("/teamStates/${t.id}");
          Navigator.push(context, SlideLeftRoute(page: TeamStatesData("${t.id}")));
        },
        child: Container(
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(color: Colors.white54, width: 0.5))),
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 25),
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 1.0),
                      child: ClipOval(
                        child: playerData.player.profilePic != null ? Image.network(
                                CallApi().baseUrl+'${playerData.player.profilePic}',
                                height: 50,
                                width: 50,
                                                        )
                                           :Image.asset(
                          'assets/img/b.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(bottom: 1.0),
                      child: ClipOval(
                        child: otherPlayerPic != null ? Image.network(
                                                          CallApi().baseUrl+'${otherPlayerPic}',
                                                          height: 50,
                                                          width: 50,
                                                        )
                                           :Image.asset(
                          'assets/img/b.jpg',
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                //margin: EdgeInsets.fromLTRB(15, 60, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 4, bottom: 4),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${t.teamName}',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      //margin: EdgeInsets.fromLTRB(0, 3, 0, 10),
                      child: Text(
                        '( w/$otherPlayerName )',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 15.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    }
    return teams;
  }
}
