import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/animatedLoaders/TeamProfileLoader.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/model/team/teamStats.dart';
import 'package:padelmatchv2/screens/player/playerStatsScreen.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';

class TeamStatesData extends StatefulWidget {
  var teamId;
  TeamStatesData(this.teamId);
  @override
  _TeamStatesDataState createState() => _TeamStatesDataState();
}

class _TeamStatesDataState extends State<TeamStatesData> {
  bool _isLoading = true;
  var teamData;
  @override
  void initState() {
    _getTeamStats();
    super.initState();
  }

  Future _getTeamStats() async {
    var res = await CallApi().getData('team-stats/${widget.teamId}');
    final body = json.decode(res.body);
    print('body is ');
    print(widget.teamId);
    print(body);
    var data = TeamStats.fromJson(body);
    setState(() {
      teamData = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(
        child: TeamLoder(), 
      );
    }
    return SafeArea(
      top: false,
      child: Container(
        child: Scaffold(
          //appBar: AppBar(backgroundColor: Colors.black,automaticallyImplyLeading: false),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              //margin: EdgeInsets.only(left: 60.0, top: 70.0, right: 60.0),

              child: Column(
                children: <Widget>[
                  Container(
                      // constraints: new BoxConstraints.expand(
                      //   height: 210.0,
                      // ),
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(left: 0.0, bottom: 15.0, top: 40),
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
                       // margin: EdgeInsets.only(left: 3, right: 15, top: 3),
                        //color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                             // color: Colors.blue,
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              child: BackButton(
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.only(left: 70, top: 30),
                              //color: Colors.red,
                              alignment: Alignment.center,
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 140,
                                    alignment: Alignment.center,
                                   // color: Colors.yellow,
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.only(bottom: 12.0),
                                          child: ClipOval(
                                            child: teamData.team.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${teamData.team.player1.profilePic}',
                                                          height: 75,
                                                          width: 75,
                                                        )
                                                        :Image.asset(
                                              'assets/img/b.jpg',
                                              height: 75,
                                              width: 75,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 65,
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            margin:
                                                EdgeInsets.only(bottom: 1.0),
                                            child: ClipOval(
                                              child: teamData.team.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${teamData.team.player2.profilePic}',
                                                          height: 75,
                                                          width: 75,
                                                        )
                                                        :Image.asset(
                                                'assets/img/b.jpg',
                                                height: 75,
                                                width: 75,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${teamData.team.teamName}',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'BebasNeue',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  teamData.currentDiv.length>0 ? Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    child: Text(
                                      '${teamData.currentDiv[0].div.divisionName}',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'BebasNeue',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ):Container(),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: _lastFiveBullets()),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),

                  ////////////////Summery Start///////////////////

                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 15),
                    padding: EdgeInsets.only(bottom: 3, top: 3, left: 30, right: 30),
                    alignment: Alignment.center,
                    width: 500,
                    //height: 100,
                    //color: Colors.grey,
                    decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(6.0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          //color: Colors.red,
                          height: 70,
                          width: 50,
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 1.0),
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
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.center,
                                child: Text(
                                  '${teamData.totalMatches}',
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
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 1.0),
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
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.center,
                                child: Text(
                                  '${teamData.totalWon}',
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
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 1.0),
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
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.center,
                                child: Text(
                                  '${teamData.totalDraw}',
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
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 1.0),
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
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.center,
                                child: Text(
                                  '${teamData.totalLoss}',
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

                  //////////////// Summery End///////////////////

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
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[

                              //////////player 1//////////
                              GestureDetector(
                                onTap: () {
                                      //Navigator.of(context).pushNamed("/playerStates/${teamData.team.player1.id}");
                                      Navigator.push(context, SlideLeftRoute(page: PlayerStatesData("${teamData.team.player1.id}")));
                                    },
                                 child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                          //color: Colors.blue,
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.topLeft,
                                                margin: EdgeInsets.only(
                                                    bottom: 1.0, right: 10),
                                                child: ClipOval(
                                                  child: teamData.team.player1.profilePic != null ? Image.network(
                                                              CallApi().baseUrl+'${teamData.team.player1.profilePic}',
                                                              height: 55,
                                                              width: 55,
                                                            )
                                                            :
                                                            Image.asset(
                                                    'assets/img/b.jpg',
                                                    height: 55,
                                                    width: 55,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                            child: Container(
                                            //color: Colors.red,
                                            alignment: Alignment.centerLeft,
                                            //margin: EdgeInsets.fromLTRB(15, 60, 0, 0),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 4, bottom: 4),
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      '${teamData.team.player1.firstName} ${teamData.team.player1.lastName}',
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontFamily: 'BebasNeue',
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                 teamData.team.canSee ? Container(
                                                    alignment: Alignment.centerLeft,
                                                    //margin: EdgeInsets.fromLTRB(0, 3, 0, 10),
                                                    child: Text(
                                                      '${teamData.team.player1.email}',
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style: TextStyle(
                                                        color: Colors.white54,
                                                        fontSize: 14.0,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ):Container(),
                                                ],
                                            ),
                                          ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      
                                      teamData.team.canSee ? Container(
                                        margin: EdgeInsets.only(left: 2),
                                        padding:
                                            EdgeInsets.only(top: 25, bottom: 4),
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          '${teamData.team.player1.phone == null ? '--' : teamData.team.player1.phone}',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ) : Container()
                                    ],
                                  ),
                                ),
                              ),

                              //////////player 1 end//////////

                              //////////player 2//////////
                              GestureDetector(
                                onTap: () {
                                        //Navigator.of(context).pushNamed("/playerStates/${teamData.team.player2.id}");
                                        Navigator.push(context, SlideLeftRoute(page: PlayerStatesData("${teamData.team.player2.id}")));
                                      },
                                child: Container(
                                  //color: Colors.red,
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                         child: Container(
                                          //color: Colors.red,
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.topLeft,
                                                margin: EdgeInsets.only(
                                                    bottom: 1.0, right: 15),
                                                child: ClipOval(
                                                  child: teamData.team.player2.profilePic != null ? Image.network(
                                                              CallApi().baseUrl+'${teamData.team.player2.profilePic}',
                                                              height: 55,
                                                              width: 55,
                                                            )
                                                            :Image.asset(
                                                    'assets/img/b.jpg',
                                                    height: 55,
                                                    width: 55,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                              child: Container(
                                            ///color: Colors.red,
                                            alignment: Alignment.centerLeft,
                                            //margin: EdgeInsets.fromLTRB(15, 60, 0, 0),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 4, bottom: 4),
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      '${teamData.team.player2.firstName} ${teamData.team.player2.lastName}',
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.0,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontFamily: 'BebasNeue',
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  teamData.team.canSee ? Container(
                                                    alignment: Alignment.centerLeft,
                                                    //margin: EdgeInsets.fromLTRB(0, 3, 0, 10),
                                                    child: Text(
                                                      '${teamData.team.player2.email}',
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style: TextStyle(
                                                        color: Colors.white54,
                                                        fontSize: 14.0,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontFamily: 'Lato',
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),
                                                  ) : Container(),
                                                ],
                                            ),
                                          ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      
                                     teamData.team.canSee ? Container(
                                        margin: EdgeInsets.only(left: 2),
                                        padding:
                                            EdgeInsets.only(top: 25, bottom: 4),
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          '${teamData.team.player2.phone == null ? '--' : teamData.team.player2.phone}',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ):Container()
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

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
                                    EdgeInsets.fromLTRB(15.0, 15.0, 35.0, 12.0),
                                child: Text(
                                  FlutterI18n.translate(context, "PREVIOUS DIVISIONS"),
                                  //'PREVIOUS DIVISIONS',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _previousDivs(),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _lastFiveBullets() {
    List<Widget> bullets = [];
    for (var f in teamData.lastFives) {
      bullets.add(Container(
        margin: EdgeInsets.only(right: 3),
        child: Icon(
          Icons.radio_button_checked,
          color: f.result == 'L'
              ? Colors.red[300]
              : f.result == 'W' ? Colors.teal[300] : Colors.white54,
          size: 18,
        ),
      ));
    }

    return bullets;
  }

  List<Widget> _previousDivs() {
    List<Widget> previDivs = [];
    var i = 0;
    for (var d in teamData.currentDiv) {
      if (i != 0) {
        previDivs.add(Container(
          height: 25,
          width: MediaQuery.of(context).size.width,
          //color: Colors.red,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            bottom: 5,
          ),
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              border: BorderDirectional(
                  bottom: BorderSide(color: Colors.white54, width: 0.5))),
          child: Text(
            '${d.div.divisionName}',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19.0,
              decoration: TextDecoration.none,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
      }
      i++;
    }

    return previDivs;
  }
}
