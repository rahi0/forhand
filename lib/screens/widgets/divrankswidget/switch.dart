import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/animatedLoaders/onlymatchloader.dart';
import 'package:padelmatchv2/animatedLoaders/sivisionStandingLoader.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/model/DivisionFixutureAndRank/divData.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/screens/divranks/DivRankHomePage.dart';
import 'package:padelmatchv2/screens/widgets/divrankswidget/matches.dart';
import 'package:padelmatchv2/screens/widgets/divrankswidget/myMatchesWidget.dart';
import 'package:padelmatchv2/screens/widgets/divrankswidget/standing.dart';
import 'package:padelmatchv2/standing/matches/matches.dart';

class BodyWidget extends StatefulWidget {
  var divData;
  var divisionData;
  var initialIndex;
  var divisionRanks;
  var myRanks;
  var myMatches;
  var myDiv;
  bool isComingFromStanding;

  bool _isShowMyMatchesOnly = false;
  BodyWidget(this.divData, this.divisionData, this.initialIndex,
      this.divisionRanks, this.myDiv, this.myMatches, this._isShowMyMatchesOnly, this.isComingFromStanding, this.myRanks);

  @override
  State<StatefulWidget> createState() => BodyWidgetState();
}

class BodyWidgetState extends State<BodyWidget>
    with TickerProviderStateMixin<BodyWidget> {
  WidgetMarker selectedWidgetMarker;

  AnimationController _controller;
  Animation _animation;

  Color buttonText = Colors.grey;
  Color buttonIndicatior = Colors.black;
  bool _isLoading = false;
 

  @override
  void initState() {
    
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _setMatchOrStandingScreen();

  }

  void _setMatchOrStandingScreen(){
    if(widget.isComingFromStanding){
        selectedWidgetMarker = WidgetMarker.standings;
    }else{
       selectedWidgetMarker = WidgetMarker.matches;
    }
  }

  void _getDivData(isMatch) {
    if (isMatch) {
      setState(() {
        selectedWidgetMarker = WidgetMarker.matches;
      });
    } else {
      setState(() {
        selectedWidgetMarker = WidgetMarker.standings;
      });
    }
  }

  // get new data

  void _getNewData(index) async {
     
    var divId = widget.divData.div[index].id;
    // IF USER CLICK ON SAME DIVISION THEN SIMPLY RETURN
    // if (divId == widget.divData.div[widget.initialIndex].id) {
    //   print('I am in same place');
    //   return;
    // }
    setState(() {
      _isLoading = true;
    });
    for(var m in widget.divData.div){
      setState(() {
          m.isSelected = false;
      });
    }

    var res = await CallApi().getData('matches-with-rank/$divId');
    final body = json.decode(res.body);
    List divisionData = [];
    // EXTRACT THE MATCHES
    if(body['matches'] != null){
      body['matches'].forEach((el) {
        var sublist = el.map((val) => DivMatches.fromJson(val)).toList();
        divisionData.add(sublist);
      });
    }
    
    
    // EXTRACT THE RANKS
    var rankData = DivRanking.fromJson(body['divRanking']); // ranks for this division...

    
    store.dispatch(DivisionData(divisionData));
    store.dispatch(DivisionRank(rankData.ranks));  // UPDATE DIVISIONS RANK TO STORE 
    setState(() {
      //widget.divData.div[widget.initialIndex].isSelected = false;
      widget.divData.div[index].isSelected = true;
      //widget.initialIndex = index;
      //widget.divisionData = divisionData;
      //store.dispatch(SingleDivMatch(divisionData));
      //widget.divisionRanks = rankData.ranks;
    });
    _isLoading = false;

    
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ///////////Spacing///////////
              Container(
                width: 20,
              ),
              ///////////Spacing///////////

              Container(
                //color: Colors.red,
                alignment: Alignment.center,
                height: 50,
               // width: 195,
                child: Container(
                  height: 30.5,
                //  width: 148,
                padding: EdgeInsets.only(left: 1, right: 1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.0)),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 29,
                      //  width: 69,
                       // margin: EdgeInsets.only(left: 1, right: 1),
                        decoration: BoxDecoration(
                            color:
                                (selectedWidgetMarker == WidgetMarker.matches)
                                    ? Colors.white
                                    : Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              bottomLeft: Radius.circular(4.0),
                            )),
                        child: FlatButton(
                          onPressed: () {
                            _getDivData(true);
                          },
                          child: Text(
                            FlutterI18n.translate(context, "Matches"),
                            //'Matches',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color:
                                  (selectedWidgetMarker == WidgetMarker.matches)
                                      ? Colors.black
                                      : Colors.white,
                              fontSize: 12.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 29,
                      //  width: 76,
                        decoration: BoxDecoration(
                            color:
                                (selectedWidgetMarker == WidgetMarker.matches)
                                    ? Colors.black
                                    : Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4.0),
                              bottomRight: Radius.circular(4.0),
                            )),
                        child: FlatButton(
                          onPressed: () {
                            _getDivData(false);
                          },
                          child: Text(
                            FlutterI18n.translate(context, "Standings"),
                           // 'Standings',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color:
                                  (selectedWidgetMarker == WidgetMarker.matches)
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 12.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: 20,
              ),
            ],
          ),

          ////////////Scrollable Button Start//////////////
          showAllOrMyMatches(), 

          ////////////Scrollable Button Start//////////////

          ////////////Content Viewport Start///////////////

          Container(
            height: MediaQuery.of(context).size.height / 1.5,
            child: FutureBuilder(
              future: _playAnimation(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return isLoadingDivData(
                    widget.divisionData, widget.divisionRanks);
                // return Rounds(
                //     widget.divisionData); // IT CAN BE MATCH OR RANK...
              },
            ),
          ),
        ],
      ),
    );
  }

  ////////Animation Play////////
  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  // LOGIC FOR LOADER , MATCHES, RANK AND MYMATCH AND MYRANK...
  Widget isLoadingDivData(divisionData, divisionRanks) {
    if (_isLoading) {
      if (selectedWidgetMarker == WidgetMarker.matches) {
        return SingleCardLoder();
      } else {
        return DivisionStandingCardLoader();
      }
    }
    if (selectedWidgetMarker == WidgetMarker.matches) { 
      if(widget._isShowMyMatchesOnly){
        
        // return MyMatchesCards(widget.myMatches);
        return MyMatchesCards();  
      }
      return Rounds(store.state.divMatches);  // SEND DATA FROM STORE FOR DIVISION DATA...
    } else {
      return getStandingsContainer(divisionRanks);
    }
  }

  Widget showAllOrMyMatches() {
    if (!widget._isShowMyMatchesOnly) {
      return allMatches();
    } else {
      return onlyMyMatch();
    }
  }

  Widget onlyMyMatch() {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: Container(
            margin: EdgeInsets.only(left: 1, bottom: 10),
            height: 30,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                         color: Colors.red
                            ))),
            child: FlatButton(
              child: Text(
                '${widget.myDiv['divisionName']}',
               
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 14.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                    color: Colors.white
                        ),
              ),
              onPressed: () {
                //_getNewData(index);
              },
            ),
          )
    );
  }




  Widget allMatches() { // ALL MATCHES CARDS 
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: widget.divData.div.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(left: 1, bottom: 10),
            height: 30,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: widget.divData.div[index].isSelected
                            ? Colors.red
                            : Colors.black))),
            child: FlatButton(
              child: Text(
                '${widget.divData.div[index].divisionName}',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 14.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                    color: widget.divData.div[index].isSelected
                        ? Colors.white
                        : Colors.grey),
              ),
              onPressed: () {
                _getNewData(index);
              },
            ),
          );
        },
      ),
    );
  }

  ////////WidgetMarker Logic////////

  // Widget getCustomContainer() {
  //   switch (selectedWidgetMarker) {
  //     case WidgetMarker.matches:
  //       return getMatchesContainer();
  //     case WidgetMarker.standings:
  //       return getStandingsContainer();
  //   }
  //   return getMatchesContainer();
  // }

  ////////MATCHES Container////////

  Widget getMatchesContainer() {
    return FadeTransition(
      opacity: _animation,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Matchess(), 
            ],
          ),
        ),
      ),
    );
  }

  ////////Standing Container////////

  Widget getStandingsContainer(divisionRanks) {
    print('this is rank');
    print(widget._isShowMyMatchesOnly);
    if(widget._isShowMyMatchesOnly){
       store.dispatch(DivisionRank(widget.myRanks));  // UPDATE DIVISIONS RANK TO STORE 
    }
    if (store.state.divRank.length == 0) {
      // there is no data
      return Container(
        child: Center(
          child: Text(
            FlutterI18n.translate(context, "No data found."),
            //'No data found.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
   
    List<Widget> _rankItems = [];
    var i = 1;
    for (var r in store.state.divRank) {
      _rankItems.add(PlayerCards(r, i));
      i++;
    }
    return FadeTransition(
      opacity: _animation,
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: _rankItems,
          ),
        ),
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final item;
  MatchCard(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      alignment: Alignment.center,
      width: 500,
      //height: 100,
      //color: Colors.grey,
      decoration: BoxDecoration(
          color: Colors.grey[850], borderRadius: BorderRadius.circular(6.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(60.0, 30.0, 15.0, 0.0),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      child: Image.asset(
                                        'assets/img/aaa.jpg',
                                        height: 45,
                                        width: 45,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(bottom: 1.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/aa.jpg',
                                        height: 45,
                                        width: 45,
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
                                '${item.home.teamName}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
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
                        padding: EdgeInsets.fromLTRB(10.0, 13.0, 15.0, 0.0),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'v/s',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 11.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.normal,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(bottom: 1.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/aa.jpg',
                                        height: 45,
                                        width: 45,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(bottom: 1.0),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/aaa.jpg',
                                        height: 45,
                                        width: 45,
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
                                '${item.away.teamName}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
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
                  margin: EdgeInsets.fromLTRB(120.0, 10, 0, 0),
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        //color: Colors.red,
                        alignment: Alignment.center,
                        child: Text(
                          '${item.homeTeamPoint}',
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
                          '${item.awayTeamPoint}',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MatchLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
