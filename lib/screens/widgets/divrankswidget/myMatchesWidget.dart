import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/screens/divResult/divAddEditResult.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/team/teamStatsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyMatchesCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: store.state.myMatches.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: new Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ROUND ${store.state.myMatches[index][0].round + 1}',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${store.state.myMatches[index][0].dayName} | ${store.state.myMatches[index][0].playingDate} | ${store.state.myMatches[index][0].playingTime}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: store.state.myMatches[index][0]
                                                .isPostponedRound ==
                                            1
                                        ? Colors.red[300]
                                        : Colors.white70,
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
                      ],
                    ),
                  ),
                  Container(
                      child: Column(
                          children:
                              prepareCardWidgets(store.state.myMatches[index])))
                ],
              ),
            ),
          );
        });
  }
}

List<Widget> prepareCardWidgets(data) {
  List<Widget> widgets = [];
  data.forEach((item) {
    widgets.add(UpcomingMatchesCards(item));
  });

  return widgets;
}

class UpcomingMatchesCards extends StatelessWidget {
  final item;
  UpcomingMatchesCards(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: 310,
      padding: EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 5),
      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[850],
          border: item.isPostponedRound == 0 && item.isPostponed == 1
              ? Border.all(color: Colors.red[300])
              : Border.all(color: Colors.transparent)),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /////////////Team/////////////
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          //Navigator.of(context).pushNamed("/teamStates/${item.home.id}");
                          Navigator.push(
                              context,
                              SlideLeftRoute(
                                  page: TeamStatesData("${item.home.id}")));
                        },
                        child: Container(
                          // color: Colors.red,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 115,
                                margin: EdgeInsets.only(bottom: 3),
                                alignment: Alignment.center,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(bottom: 5.0),
                                      child: ClipOval(
                                        child: item.home.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${item.home.player1.profilePic}',
                                                          height: 60,
                                                          width: 60,
                                                        )
                                                        :Image.asset(
                                          'assets/img/b.jpg',
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 55,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(bottom: 1.0),
                                        child: ClipOval(
                                          child: item.home.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${item.home.player2.profilePic}',
                                                          height: 60,
                                                          width: 60,
                                                        )
                                                        :Image.asset(
                                            'assets/img/b.jpg',
                                            height: 60,
                                            width: 60,
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
                                  '${item.home.teamName}',
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
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        margin: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.center,
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
                          //Navigator.of(context).pushNamed("/teamStates/${item.home.id}");
                          Navigator.push(
                              context, 
                              SlideLeftRoute(
                                  page: TeamStatesData("${item.away.id}")));
                        },
                        child: Container(
                          //color: Colors.red,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 115,
                                margin: EdgeInsets.only(bottom: 3),
                                alignment: Alignment.center,
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(bottom: 5.0),
                                      child: ClipOval(
                                        child: item.away.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${item.away.player1.profilePic}',
                                                          height: 60,
                                                          width: 60,
                                                        )
                                                        :Image.asset(
                                          'assets/img/b.jpg',
                                          height: 60,
                                          width: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 55,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(bottom: 1.0),
                                        child: ClipOval(
                                          child: item.away.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${item.away.player2.profilePic}',
                                                          height: 60,
                                                          width: 60,
                                                        )
                                                        :Image.asset(
                                            'assets/img/b.jpg',
                                            height: 60,
                                            width: 60,
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
                                  '${item.away.teamName}',
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
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          /////////////Team end/////////////

          /////////////Result/////////////
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 5,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Text(
                          '${item.homeTeamPoint == null ? 0 : item.homeTeamPoint}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        width: 13,
                        height: 1.0,
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 10, right: 10),
                      ),
                      Container(
                        child: Text(
                          '${item.awayTeamPoint == null ? 0 : item.awayTeamPoint}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          /////////////Result end/////////////

          /////////////Sets/////////////
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 10),
            height: 50,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                ////////// SET 1///////////
                Container(
                  height: 31,
                  width: 62,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 31,
                        width: 30,
                        decoration: BoxDecoration(
                            border:
                                Border(right: BorderSide(color: Colors.white))),
                        child: Text(
                          '${item.setOne == null ? 0 : item.setOne.split('-')[0]}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      ///////////////
                      Container(
                        alignment: Alignment.center,
                        height: 31,
                        width: 30,
                        child: Text(
                          '${item.setOne == null ? 0 : item.setOne.split('-')[1]}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ////////// SET 2 ///////////
                Container(
                  height: 31,
                  width: 62,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 31,
                        width: 30,
                        decoration: BoxDecoration(
                            border:
                                Border(right: BorderSide(color: Colors.white))),
                        child: Text(
                          '${item.setTwo == null ? 0 : item.setTwo.split('-')[0]}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      ///////////////
                      Container(
                        alignment: Alignment.center,
                        height: 31,
                        width: 30,
                        child: Text(
                          '${item.setTwo == null ? 0 : item.setTwo.split('-')[1]}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ////////// SET 3 ///////////
                Container(
                  height: 31,
                  width: 62,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.white)),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 31,
                        width: 30,
                        decoration: BoxDecoration(
                            border:
                                Border(right: BorderSide(color: Colors.white))),
                        child: Text(
                          '${item.setThree == null ? 0 : item.setThree.split('-')[0]}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      ///////////////
                      Container(
                        alignment: Alignment.center,
                        height: 31,
                        width: 30,
                        child: Text(
                          '${item.setThree == null ? 0 : item.setThree.split('-')[1]}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 30,
                )
              ],
            ),
          ),
          /////////////Sets end/////////////

          ////////////////Court/////////////
          Container(
            //color: Colors.red,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            height: 30,
            child: Container(
              child: Text(
                item.isPostponed == 1
                    ? '${item.dayName} | ${item.playingDate} | ${item.playingTime} | ${item.courtName}'
                        .toUpperCase()
                    : '${item.court.courtName}'.toUpperCase(),
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: item.isPostponed == 1 ? Colors.red[300] : Colors.white70,
                  fontSize: 14.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          /////////////Court end////////////

          ////////////////Match ID/////////////
          Container(
            //color: Colors.red,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerRight,
            height: 20,
            child: Container(
              child: Text(
                'ID: ${item.id}',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          /////////////Match ID end////////////

          /////////////Enter Result////////////
          GestureDetector(
            onTap: () {
              _addResult(context, item);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  border: BorderDirectional(
                      top: BorderSide(color: Colors.red[400], width: 0.5))),
              child: Text(
                FlutterI18n.translate(context, "Enter Result"),
                //'Enter Result',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 19.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
          /////////////Enter Result End////////////
        ],
      ),
    );
  }

  void _addResult(context, item) async {
    // var itemJson =  json.encode(item);
    //  SharedPreferences localStorage = await SharedPreferences.getInstance();
    //  localStorage.setString('match', itemJson);
    //itemJson = itemJson.toString();
    //  var decoded = json.decode(itemJson);
    //  var data = DivMatches.fromJson(decoded);
    //  print(data);
    // Navigator.pushNamed(context, "/divresult/2");
    //  print(store.state.myMatches[index]);
    print(item);
    Navigator.push(context, SlideLeftRoute(page: EnterResult(item)));
  }
}
