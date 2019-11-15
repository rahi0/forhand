
import 'package:flutter/material.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/screens/divranks/DivRankHomePage.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/team/teamStatsScreen.dart';

class UpcomingMatchesCard extends StatelessWidget {
  final match;
  final int index;
  UpcomingMatchesCard(this.match, this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                //Navigator.pushNamed(context, "/divrank/${match[index].div.id}/${match[index].trId}");
                 Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${match[index].div.id}", "${match[index].trId}")));
              },
          child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 15.0, 0, 12.0),
                                  child: Text(
                                    'ROUND ${match[index].round+1}',
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
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                  padding:EdgeInsets.fromLTRB(1, 15.0, 0.0, 12.0),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${match[index].dayName} | ${match[index].playingDate} | ${match[index].playingTime}',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: match[index].isPostponed == 1 || match[index].isPostponedRound == 1? Colors.red[300] : Colors.white70,
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
                                  //margin: EdgeInsets.only(left: 30),
                                  alignment: Alignment.topLeft,
                                  child: IconButton(
                                    onPressed: (){
                                      print('object');
                                    },
                                    icon: Icon(Icons.more_vert,
                                        color: Colors.white),
                                  ),
                                ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                 // color: Colors.red,
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 10.0, 15.0, 7.0),
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      // Container(
                                      //   alignment: Alignment.centerLeft,
                                      //   child: Text(
                                      //     'Your upcoming match in',
                                      //     textDirection: TextDirection.ltr,
                                      //     style: TextStyle(
                                      //       color: Colors.white,
                                      //       fontSize: 15.0,
                                      //       decoration: TextDecoration.none,
                                      //       fontFamily: 'Lato',
                                      //       fontWeight: FontWeight.normal,
                                      //     ),
                                      //   ),
                                      // ),
                                      // Container(
                                      //   alignment: Alignment.centerLeft,
                                      //   child: Text(
                                      //     ' ${match[index].div.divisionName}',
                                      //     textDirection: TextDirection.ltr,
                                      //     style: TextStyle(
                                      //       color: Colors.white,
                                      //       fontSize: 15.0,
                                      //       decoration: TextDecoration.none,
                                      //       fontFamily: 'Lato',
                                      //       fontWeight: FontWeight.w900,
                                      //     ),
                                      //   ),
                                      // ),
                                      Container()
                                    ],
                                  ),
                                ),
                                Container(
                                 // color: Colors.blue,
                                  padding:EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 0.0),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          //Navigator.of(context).pushNamed("/teamStates/${match[index].homeTeam}");
                                          Navigator.push(context, SlideLeftRoute(page: TeamStatesData("${match[index].homeTeam}")));
                                        },
                                          child: Container(
                                          //color: Colors.yellow,
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                //padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          bottom: 1.0),
                                                      child: ClipOval(
                                                        child: match[index].home.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${match[index].home.player1.profilePic}',
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
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          bottom: 1.0),
                                                      child: ClipOval(
                                                        child: match[index].home.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${match[index].home.player2.profilePic}',
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
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10.0, 10.0, 15.0, 0.0),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '${match[index].home.teamName}',
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
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 13.0, 15.0, 0.0),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'v/s',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 14.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                         // Navigator.of(context).pushNamed("/teamStates/${match[index].awayTeam}");
                                         Navigator.push(context, SlideLeftRoute(page: TeamStatesData("${match[index].awayTeam}")));
                                          
                                        },
                                        child: Container(
                                          //color: Colors.teal,
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          bottom: 1.0),
                                                      child: ClipOval(
                                                        child: match[index].away.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${match[index].away.player1.profilePic}',
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
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          bottom: 1.0),
                                                      child: ClipOval(
                                                        child: match[index].away.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${match[index].away.player2.profilePic}',
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
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10.0, 10.0, 15.0, 0.0),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  '${match[index].away.teamName}',
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
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  //color: Colors.green,
                                    padding: EdgeInsets.fromLTRB( 0.0, 10.0, 0.0, 10.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      match[index].isPostponed == 1 || match[index].isPostponedRound == 1 ?  '${match[index].courtName}'.toUpperCase() : '${match[index].court.courtName}'.toUpperCase(),
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.normal,
                                        
                                      ),
                                    )),

                                    
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}