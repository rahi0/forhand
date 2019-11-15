import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/model/americano/americanoModel.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/screens/widgets/americanoWidgets/americanoMatchesCard.dart';

import 'package:padelmatchv2/screens/widgets/americanoWidgets/standingCard.dart';

enum WidgetMarker { matches, standings }

/////////// For DropDown ////////
class DropItem {
  const DropItem(this.id, this.name);

  final String name;
  final int id;
}
/////////// For DropDown ////////

class BodyWidget extends StatefulWidget {
  var matchesData;
  var ranks;
  var trId;
  BodyWidget(this.matchesData, this.ranks, this.trId);
  @override
  State<StatefulWidget> createState() => BodyWidgetState();
}

class BodyWidgetState extends State<BodyWidget>
    with SingleTickerProviderStateMixin<BodyWidget> {
  WidgetMarker selectedWidgetMarker = WidgetMarker.matches;
  AnimationController _controller;
  Animation _animation;
  DropItem selectedItem;
  List<DropItem> items = <DropItem>[
    const DropItem(1, 'Group A'),
    const DropItem(2, 'Group B'),
    const DropItem(3, 'Final')
  ];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    
    selectedItem = items[0];
  }

  _getNewData(groupName, item) async {
   
    store.dispatch(AmricanoMatches([]));
    var res = await CallApi().getData('get-americano-matches/${widget.trId}/$groupName');
    final body = json.decode(res.body);
    var matchData = [];
    var americanoPoints = AmericanoPoints.fromJson(body['points']); 
    body['matches'].forEach((el) { 
      var sublist = el.map((val) => Matches.fromJson(val)).toList(); 
        matchData.add(sublist); 
    });
    store.dispatch(AmricanoMatches(matchData));
    store.dispatch(AmericanoRanks(americanoPoints.ranks));

    setState(() {
        widget.matchesData = [];
        selectedItem = item;
    });
}

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ///////////DropDown///////////
                  Container(
                    height: 25,
                    width: 64,
                    margin: EdgeInsets.only(left: 15, right: 0),
                    child: DropdownButtonHideUnderline(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
                            border: Border.all(color: Colors.white54)),
                        child: DropdownButton<DropItem>(
                          value: selectedItem,
                          onChanged: (DropItem newValue) {
                            _getNewData(newValue.name, newValue);
                            
                          },
                          items: items.map((DropItem user) {
                            return new DropdownMenuItem<DropItem>(
                              value: user,
                              child: Container(
                                margin: EdgeInsets.only(left: 5, top: 2),
                                //color: Colors.red,
                                child: new Text(
                                  user.name,
                                  textDirection: TextDirection.ltr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'BebasNeue',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),

                  ///////////DropDown End///////////

                  Container(
                    alignment: Alignment.center,
                   // color: Colors.amber,
                    height: 50,
                   // width: 195, 
                    child: Container(
                       padding: EdgeInsets.only(left: 1, right: 1),
                      height: 30.5,
                      //width: 148,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.0)),
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          ////////////// Matches Button //////////////
                          Container(
                            height: 29,
                           // width: 69,
                           
                            decoration: BoxDecoration(
                                color: (selectedWidgetMarker ==
                                        WidgetMarker.matches)
                                    ? Colors.white
                                    : Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  bottomLeft: Radius.circular(4.0),
                                )),
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  selectedWidgetMarker = WidgetMarker.matches;
                                });
                              },
                              child: Text(
                                FlutterI18n.translate(context, "Matches"),
                                //'Matches',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: (selectedWidgetMarker ==
                                          WidgetMarker.matches)
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

                          ////////////// Matches Button End //////////////

                          ////////////// Standings Button //////////////
                          Container(
                            height: 29,
                           // width: 76,
                            //padding: EdgeInsets.only(top: 1),
                            decoration: BoxDecoration(
                                color: (selectedWidgetMarker ==
                                        WidgetMarker.matches)
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4.0),
                                  bottomRight: Radius.circular(4.0),
                                )),
                            child: FlatButton(
                              onPressed: () {
                                setState(() {
                                  selectedWidgetMarker = WidgetMarker.standings;
                                });
                              },
                              child: Text(
                                FlutterI18n.translate(context, "Standings"),
                               // 'Standings',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: (selectedWidgetMarker ==
                                          WidgetMarker.matches)
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

                          ////////////// Standings Button End //////////////
                        ],
                      ),
                    ),
                  ),

                  ///////////////Icon Button//////////////

                  Container(
                    margin: EdgeInsets.only(left: 0, right: 10),
                    child: IconButton(
                      icon: Icon(Icons.account_box),
                      iconSize: 24,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  )

                  ///////////////Icon Button end//////////////
                ],
              ),
            ),

            ////////////// Body //////////////
            Container(
              child: FutureBuilder(
                future: _playAnimation(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return getCustomContainer();
                },
              ),
            )

            ////////////// Body End //////////////
          ],
        ),
      ),
    );
  }

  _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.matches:
        return getGraphContainer();
      case WidgetMarker.standings:
        return getStatsContainer();
    }
    return getGraphContainer();
  }

  //////////////Matches////////////////
  Widget getGraphContainer() {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        child: Column(children: _getAmericanoRound()),
      ),
    );
  }

  List<Widget> _getAmericanoRound() {
    List<Widget> rounds = [];
    var index = 1;
    
    
    for (var r in store.state.amricanoMatches) {
      
      rounds.add(AmericanoRound(r, index)); 
      index++;
    }
    return rounds;
  } 

  /////////////Matches End////////////

  ///////////Standings////////////////
  Widget getStatsContainer() {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        child: Column(children: _getAmericanoSingleCard()),
      ),
    );
  }

  List<Widget> _getAmericanoSingleCard() {
    List<Widget> ranksData = [];
     
    var index = 1;
    for (var r in store.state.americanoRanks) {
      ranksData.add(StandingPlayerCard(r, index));
      index++;
    }
    return ranksData;
  }
}

///////////////Standings End//////////////
