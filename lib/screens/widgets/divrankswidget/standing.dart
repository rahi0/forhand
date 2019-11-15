import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/screens/rankDetails/rankDetailScreen.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

///////////Standings////////////////

class PlayerCards extends StatelessWidget {
  final rank;
  final position;
  PlayerCards(this.rank, this.position);
  void _showRankDetails(context, r) async {
    var itemJson = json.encode(r);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('rank', itemJson);
    print(rank.team);
    //Navigator.of(context).pushNamed("/rankDetails");
    Navigator.push(context, SlideLeftRoute(page: RankDetailsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
          onTap: () {
            _showRankDetails(context, rank);
          },
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(6.0)),
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      alignment: Alignment.center,
                      //color: Colors.blue,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 0, right: 3),
                            alignment: Alignment.center,
                            child: Text(
                              '$position',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(5.0, 0.0, 10.0, 0.0),
                            child: Image.asset(
                              rank.status== 'up' ? 'assets/img/up.png' : rank.status== 'down' ? 'assets/img/down.png' : 'assets/img/tir.png',
                              height: 10.0,
                              width: 10.0,
                              //fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 95,
                            alignment: Alignment.center,
                            //color: Colors.yellow,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.topLeft,
                                  //margin: EdgeInsets.only(bottom: 1.0),
                                  child: ClipOval(
                                    child: rank.team.player1.profilePic != null
                                        ? Image.network(
                                            CallApi().baseUrl +
                                                '${rank.team.player1.profilePic}',
                                            height: 50,
                                            width: 50,
                                          )
                                        : Image.asset(
                                            'assets/img/b.jpg',
                                            height: 50,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                ),
                                Positioned(
                                  left: 45,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    //margin: EdgeInsets.only(bottom: 1.0),
                                    child: ClipOval(
                                      child: rank.team.player2.profilePic != null
                                        ? Image.network(
                                            CallApi().baseUrl +
                                                '${rank.team.player2.profilePic}',
                                            height: 50,
                                            width: 50,
                                          )
                                        :Image.asset(
                                        'assets/img/bb.jpg',
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              //width: 86,
                              //color: Colors.red,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.fromLTRB(18.0, 0.0, 7.0, 0.0),
                              child: Text(
                                '${rank.team.teamName}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
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
                  ),
                  Container(
                      //height: 30,
                      //width: 40,
                      //color: Colors.red,
                      //margin: EdgeInsets.only(left: 20, top: 0),
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            //padding: EdgeInsets.fromLTRB(45.0, 17.0, 2.0, 7.0),
                            child: Text(
                              '${rank.points}',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(2.0, 25.0, 0.0, 0.0),
                            child: Text(
                              '${rank.matchePlayed}',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          )
                        ],
                      )),
                ]),
          )),
    ));
  }
}

///////////////Standings End//////////////
