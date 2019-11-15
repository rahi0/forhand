import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/model/DivisionFixutureAndRank/divData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RankDetailsScreen extends StatefulWidget {
  @override
  _RankDetailsScreenState createState() => _RankDetailsScreenState();
}

class _RankDetailsScreenState extends State<RankDetailsScreen> {
  var rankData;
  bool _isLoading = true;
  @override
  void initState() {
    _getRankData();
    super.initState();
  }

  void _getRankData() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = localStorage.getString('rank');
    var decoded = json.decode(data);
    
    var rank = Ranks.fromJson(decoded);
    setState(() {
      rankData = rank;
      _isLoading = false;
    });
    localStorage.remove('rank');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 6) / 2.8;
    final double itemWidth = size.width / 2;

    if(_isLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }else{
    return Container(
      decoration: BoxDecoration(
        // Box decoration takes a gradient
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 10, bottom: 30, left: 0, right: 0),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ////////Team///////
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 30, right: 30),
                margin: EdgeInsets.only(bottom: 10),
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                       child: Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 105,
                              //height: 60,
                              //color: Colors.yellow,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    child: ClipOval(
                                      child: rankData.team.player1.profilePic != null
                                          ? Image.network(
                                              CallApi().baseUrl +
                                                  '${rankData.team.player1.profilePic}',
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
                                  Positioned(
                                    left: 50,
                                    child: Container(
                                      child: ClipOval(
                                        child:rankData.team.player2.profilePic != null
                                          ? Image.network(
                                              CallApi().baseUrl +
                                                  '${rankData.team.player2.profilePic}',
                                              height: 55,
                                              width: 55,
                                            )
                                          : Image.asset(
                                          'assets/img/b.jpg',
                                          height: 55,
                                          width: 55,
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
                                height: 35,
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 10),
                                color: Colors.green,
                                child: Text(
                                  '${rankData.team.teamName}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
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
                  ],
                ),
              ),

              ////////Team end///////

              ////////Summery///////
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 66,
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    //borderRadius: BorderRadius.circular(10)
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ///////box1/////
                    Container(
                      //color: Colors.red,
                      height: 60,
                      width: 45,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              FlutterI18n.translate(context, "Played"),
                              //'Played',
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
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              '${rankData.matchePlayed}',
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
                    ///////box1/////

                    ///////box2/////
                    Container(
                      //color: Colors.red,
                      height: 60,
                      width: 45,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              FlutterI18n.translate(context, "won"),
                             // 'won',
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
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              '${rankData.won}',
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
                    ///////box2/////

                    ///////box3/////
                    Container(
                      //color: Colors.red,
                      height: 60,
                      width: 45,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              FlutterI18n.translate(context, "lost"),
                              //'lost',
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
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              '${rankData.loss}',
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
                    ///////box3/////

                    ///////box4/////
                    Container(
                      //color: Colors.red,
                      height: 60,
                      width: 45,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              FlutterI18n.translate(context, "draw"),
                              //'draw',
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
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              '${rankData.draw}',
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
                    ///////box4/////
                    

                    ///////box5/////
                    Container(
                      //color: Colors.red,
                      height: 60,
                      width: 45,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              FlutterI18n.translate(context, "Set"),
                              //'Set',
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
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                             '${rankData.totalSets}',
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
                    ///////box5/////
                    

                    ///////box6/////
                    Container(
                      //color: Colors.red,
                      height: 60,
                      width: 45,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              FlutterI18n.translate(context, "Games"),
                              //'Games',
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
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                             '${rankData.totalGames}',
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
                    ///////box6/////

                    ///////box7/////
                    Container(
                      //color: Colors.red,
                      height: 60,
                      width: 45,
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Container(
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                              FlutterI18n.translate(context, "points"),
                              //'points',
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
                            //color: Colors.green,
                            height: 23,
                            width: 45,
                            alignment: Alignment.center,
                            child: Text(
                             '${rankData.points}',
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
                    ///////box7/////
                  ],
                ),
              ),

              ////////Summery end///////

              ////////Cards///////
              Container(
                child: Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    //controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    children: List.generate(rankData.history.length, (index) {
                      return ResultCard(rankData.history, index);
                    }),
                  ),
                ),
              )
              ////////Cards end///////
            ],
          ),
        ),
      ),
    );
    }
  }
}

class ResultCard extends StatelessWidget {
  var history; 
  var index; 
  ResultCard(this.history, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
       // height: 238,
        width: 170,
        margin: EdgeInsets.only( top: 6),
        alignment: Alignment.center,
        //color: Colors.red,
        child: Stack(
          children: <Widget>[
            Container(
              //height: 222,
              width: 170,
              margin: EdgeInsets.only(top: 18),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ////////////Team////////////
                  Container(
                   // height: 107,
                    width: 170,
                   // color: Colors.red,
                    alignment: Alignment.center,
                    //padding: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          //height: 47,
                          //color: Colors.yellow,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                child: ClipOval(
                                  child: history[index].team.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${history[index].team.player1.profilePic}',
                                                          height: 52,
                                                          width: 52,
                                                        )
                                  :Image.asset(
                                    'assets/img/b.jpg',
                                    height: 52,
                                    width: 52,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 47,
                                child: Container(
                                  child: ClipOval(
                                    child: history[index].team.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${history[index].team.player2.profilePic}',
                                                          height: 52,
                                                          width: 52,
                                                        )
                                  :Image.asset(
                                      'assets/img/b.jpg',
                                      height: 52,
                                      width: 52,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 170,
                          height: 27,
                          padding: EdgeInsets.only(left: 5, right: 5),
                          //color: Colors.red,
                          alignment: Alignment.center,
                          child: Text(
                            '${history[index].team.teamName}',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ////////////Team End////////////

                  ////////////Result////////////
                  Container(
                   // height: 66,
                    width: 170,
                    color: history[index].winTxt == 'LOST' ? Colors.red[400].withOpacity(0.2) :  history[index].winTxt == 'WON' ? Colors.teal[300].withOpacity(0.1) : history[index].winTxt == 'DRAW' ? Colors.blue[300].withOpacity(0.1) : Colors.grey[300].withOpacity(0.1),
                    //color: Colors.red[400].withOpacity(0.2),
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 170,
                          //height: 30,
                          //color: Colors.yellow,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: 40,
                              ),
                              Container(
                                //height: 30,
                                width: 25,
                                //color: Colors.green,
                                alignment: Alignment.center,
                                child: Text(
                                  '${history[index].homeTeamPoint == null ? 0 : history[index].homeTeamPoint}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height: 2.5,
                                width: 6,
                                color: Colors.white,
                              ),
                              Container(
                                //height: 30,
                                width: 25,
                                //color: Colors.green,
                                alignment: Alignment.center,
                                child: Text(
                                  '${history[index].awayTeamPoint  == null ? 0 : history[index].awayTeamPoint}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 170,
                          //height: 25,
                          // color: Colors.black,
                          alignment: Alignment.center,
                          child: Text(
                            '${history[index].winTxt}',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: history[index].winTxt == 'LOST' ? Colors.red[400] :  history[index].winTxt == 'WON' ? Colors.teal[300] : history[index].winTxt == 'DRAW' ? Colors.blue[300] : Colors.grey[300],
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  ////////////Result end////////////

                  ////////////Sets////////////
                  Container(
                    //height: 48,
                    width: 170,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ////////set1///////
                        Container(
                          width: 30,
                          height: 30,
                          //color: Colors.green,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 10,
                                //color: Colors.green,
                                alignment: Alignment.center,
                                child: Text(
                                  '${history[index].setOne == null ? 0 : history[index].setOne.split('-')[0]}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.5,
                                width: 5,
                                color: Colors.white54,
                              ),
                              Container(
                                //height: 30,
                                width: 10,
                                //color: Colors.green,
                                alignment: Alignment.center,
                                child: Text(
                                  '${history[index].setOne == null ? 0 : history[index].setOne.split('-')[1]}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ////////set1 end/////

                        ////////set1///////
                        Container(
                          width: 30,
                          //height: 30,
                          //color: Colors.green,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 10,
                                //color: Colors.green,
                                alignment: Alignment.center,
                                child: Text(
                                  '${history[index].setTwo == null ? 0 : history[index].setTwo.split('-')[0]}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.5,
                                width: 5,
                                color: Colors.white54,
                              ),
                              Container(
                                //height: 30,
                                width: 10,
                                //color: Colors.green,
                                alignment: Alignment.center,
                                child: Text(
                                  '${history[index].setTwo == null ? 0 : history[index].setTwo.split('-')[1]}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ////////set1 end/////

                        ////////set1///////
                        Container(
                          width: 30,
                          //height: 30,
                          //color: Colors.green,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 10,
                                //color: Colors.green,
                                alignment: Alignment.center,
                                child: Text(
                                  '${history[index].setThree == null ? 0 : history[index].setThree.split('-')[0]}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                height: 1.5,
                                width: 5,
                                color: Colors.white54,
                              ),
                              Container(
                                //height: 30,
                                width: 10,
                                //color: Colors.green,
                                alignment: Alignment.center,
                                child: Text(
                                  '${history[index].setThree == null ? 0 : history[index].setThree.split('-')[1]}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 17.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ////////set1 end/////
                      ],
                    ),
                  ),
                  ////////////Sets end////////////
                ],
              ),
            ),
            Positioned(
              left: 70,
              child: Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'v/s',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
