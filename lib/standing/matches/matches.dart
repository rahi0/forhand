import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/model/div/div_matches.dart';
import 'package:padelmatchv2/screens/divResult/divAddEditResult.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/team/teamStatsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Matches extends StatefulWidget {
  final String id;
  Matches(this.id);
  @override
  _MatchesState createState() => new _MatchesState();
}

class _MatchesState extends State<Matches> with SingleTickerProviderStateMixin {
  TabController _controllertab;

  @override
  void initState() {
    super.initState();
    _controllertab = new TabController(length: 4, vsync: this);
    _getData();
  }

  Future _getData() async {
    
    var res = await CallApi().getData('matches/${widget.id}');
    final body = json.decode(res.body) as List;
    List data = [];
    body.forEach((el) {
      var sublist = el.map((val) => Match.fromJson(val)).toList();
      data.add(sublist);
    });
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot res) {
          if (res.data == null) {
            return Container(
              child: Text('this is nice'),
            );
          } else {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: new AppBar(
                backgroundColor: Colors.black,
                title: new Text(
                  'season 7',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 21.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: new ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      height: 30.5,
                      width: 146,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0)),
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 69,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  bottomLeft: Radius.circular(4.0),
                                )),
                            child: FlatButton(
                              onPressed: () {
                                //Navigator.of(context).pushNamed("/matches");
                              },
                              child: Text(
                                FlutterI18n.translate(context, "Matches"),
                               // 'Matches',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  //color: Colors.white,
                                  fontSize: 13.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 29,
                            width: 76,
                            //padding: EdgeInsets.only(top: 1),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4.0),
                                  bottomRight: Radius.circular(4.0),
                                )),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("/standings/403");
                                
                              },
                              child: Text(
                                FlutterI18n.translate(context, "Standings"),
                               // 'Standings',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
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
                  new Container(
                    margin: EdgeInsets.only(top: 15),
                    decoration: new BoxDecoration(
                        color: Colors.black,
                        border: BorderDirectional(
                            top: BorderSide(color: Colors.white54))),
                    child: new TabBar(
                      indicatorColor: Colors.red,
                      controller: _controllertab,
                      tabs: [
                        new Tab(
                          child: Text(
                             FlutterI18n.translate(context, "Elitserien"),
                            //'Elitserien',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        new Tab(
                          child: Text(
                            'Division 1',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        new Tab(
                          child: Text(
                            'Division 2',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        new Tab(
                          child: Text(
                            'Division 3',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    height: 900,
                    child: new TabBarView(
                      controller: _controllertab,
                      children: <Widget>[
                        Rounds(res.data),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}

class Rounds extends StatelessWidget {
  final match;
  Rounds(this.match);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: match.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: new Container(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                   //color: Colors.white,
                    margin: EdgeInsets.fromLTRB(15, 20, 15, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          //margin: EdgeInsets.only(right: 100),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ROUND ${match[index][0].round + 1}',
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
                          child: Text(
                            
                            '${match[index][0].dayName} | ${match[index][0].playingDate} | ${match[index][0].playingTime}',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: match[index][0].isPostponedRound == 1 ? Colors.red[300] : Colors.white70,
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
                      child: Column(children: prepareCardWidgets(match[index])))
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



class UpcomingMatchesCards extends StatefulWidget {
  final item;
  UpcomingMatchesCards(this.item);

  @override
  _UpcomingMatchesCardsState createState() => _UpcomingMatchesCardsState();
}

class _UpcomingMatchesCardsState extends State<UpcomingMatchesCards> {
  var userData;
  @override
  void initState() {
    _getUser();
    super.initState();
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
    return GestureDetector(
      onTap: (){
         setState(() {
            if(widget.item.isOpen == null) {
                 widget.item.isOpen = true;
            }else{
               widget.item.isOpen = null;
            }
           
            
         });
         
      },
        child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        alignment: Alignment.center,
        width: 500,
        //height: 100,
        //color: Colors.grey,
        decoration: BoxDecoration(
          
          color: Colors.grey[850], 
          borderRadius: BorderRadius.circular(6.0),
          
          border: widget.item.isPostponedRound == 0 && widget.item.isPostponed == 1 ? Border.all(
            color: Colors.red[300]
          ) :
          Border.all(
            color: Colors.transparent
          )
          
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            //Navigator.of(context).pushNamed("/teamStates/${widget.item.home.id}");
                            Navigator.push(context, SlideLeftRoute(page: TeamStatesData("${widget.item.home.id}")));
                          },
                          child: Container(
                            //color: Colors.blue,
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  //padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(bottom: 1.0),
                                        child: ClipOval(
                                          child: widget.item.home.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${widget.item.home.player1.profilePic}',
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
                                        margin: EdgeInsets.only(bottom: 1.0),
                                        child: ClipOval(
                                          child: widget.item.home.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${widget.item.home.player2.profilePic}',
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
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 0.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${widget.item.home.teamName}',
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
                          padding: EdgeInsets.fromLTRB(10.0, 13.0, 10.0, 0.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'v/s',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 13.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            //Navigator.of(context).pushNamed("/teamStates/${widget.item.away.id}");
                            Navigator.push(context, SlideLeftRoute(page: TeamStatesData("${widget.item.away.id}")));
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(bottom: 1.0),
                                        child: ClipOval(
                                          child: widget.item.away.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${widget.item.away.player1.profilePic}',
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
                                        margin: EdgeInsets.only(bottom: 1.0),
                                        child: ClipOval(
                                          child: widget.item.away.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${widget.item.away.player2.profilePic}',
                                                          height: 55,
                                                          width: 55,
                                                        )
                                            :Image.asset(
                                            'assets/img/aaa.jpg',
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
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 0.0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    '${widget.item.away.teamName}',
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
                    margin: EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          //color: Colors.red,
                          alignment: Alignment.center,
                          child: Text(
                            '${widget.item.homeTeamPoint == null ? 0 : widget.item.homeTeamPoint}',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 31.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(30, 20, 30, 30),
                          alignment: Alignment.center,
                          //child: Tab(icon: Icon(Icons.remove),),
                          height: 2.0,
                          width: 8,
                          color: Colors.white,
                        ),
                        Container(
                          //color: Colors.red,
                          alignment: Alignment.center,
                          child: Text(
                            '${widget.item.awayTeamPoint == null ? 0 : widget.item.awayTeamPoint}',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 31.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  //////////////Hidden Section//////////
                  
                  widget.item.isOpen != null ?
                  Container(
                    //color: Colors.red,
                    child: Column(
                      children: <Widget>[

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
                                    border: Border(
                                        right: BorderSide(color: Colors.white))),
                                child: Text(
                                  '${widget.item.setOne == null ? 0 : widget.item.setOne.split('-')[0]}',
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
                                  '${widget.item.setOne == null ? 0 : widget.item.setOne.split('-')[1]}',
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
                                    border: Border(
                                        right: BorderSide(color: Colors.white))),
                                child: Text(
                                  '${widget.item.setTwo == null ? 0 : widget.item.setTwo.split('-')[0]}',
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
                                  '${widget.item.setTwo == null ? 0 : widget.item.setTwo.split('-')[1]}',
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
                                    border: Border(
                                        right: BorderSide(color: Colors.white))),
                                child: Text(
                                  '${widget.item.setThree == null ? 0 : widget.item.setThree.split('-')[0]}',
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
                                  '${widget.item.setThree == null ? 0 : widget.item.setThree.split('-')[1]}',
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
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: <Widget>[
                       
                        Container(
                          child: Text(
                            widget.item.isPostponed == 1 ? 
                              '${widget.item.dayName} | ${widget.item.playingDate} | ${widget.item.playingTime} | ${widget.item.courtName}'.toUpperCase() 
                               :'${widget.item.court.courtName}'.toUpperCase(),
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: widget.item.isPostponed == 1 ? Colors.red[300] : Colors.white70,
                              fontSize: 14.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                              
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                  /////////////Court end////////////
                  ///
                  
                  Container(
                                      //color: Colors.teal,
                                    padding: EdgeInsets.fromLTRB( 0.0, 2.0, 10.0, 10.0),
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'ID: ${widget.item.id}',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 13.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.normal,
                                        
                                      ),
                                    )),


                      /////////////Enter Result////////////
          GestureDetector(
            onTap: () {
              Navigator.push(context, SlideLeftRoute(page: EnterResult(widget.item)));
            },
            child: userData !=null && (userData['userType'] == 'club' || userData['userType'] == 'tm') ?
             Container(
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
            ) : Container(),
          )
          /////////////Enter Result End////////////
                      ],
                    ),
                  ) : Container()

                  //////////////Hidden Section ends//////////

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

