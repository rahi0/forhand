import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/redux/thunk.dart';
import 'package:padelmatchv2/screens/divranks/DivRankHomePage.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
class EnterResult extends StatefulWidget {
  
  final match; 
  EnterResult(this.match);
  @override
  _EnterResultState createState() => _EnterResultState();
}

class _EnterResultState extends State<EnterResult> {
  bool _isAddingResult = false;
  var matchData;
  var homeTeamSet1;
  var awayTeamSet1;
  var homeTeamSet2;
  var awayTeamSet2;
  var homeTeamSet3;
  var awayTeamSet3;

  TextEditingController _homeController1;
  TextEditingController _awayController1;
  TextEditingController _homeController2;
  TextEditingController _awayController2;
  TextEditingController _homeController3;
  TextEditingController _awayController3;

  @override
  void initState() {
    super.initState();
    _getMatch();
    
   
  }
  void _getMatch() async{
     
     setState(() {
        matchData = widget.match;
     });
    _homeController1 = TextEditingController(text: '${matchData.setOne == null ? '' : matchData.setOne.split('-')[0]}');
    _awayController1 = TextEditingController(text: '${matchData.setOne == null ? '' : matchData.setOne.split('-')[1]}');
    _awayController2 = TextEditingController(text: '${matchData.setTwo == null ? '' : matchData.setTwo.split('-')[1]}');
    _homeController2 = TextEditingController(text: '${matchData.setTwo == null ? '' : matchData.setTwo.split('-')[0]}');
    _homeController3 = TextEditingController(text: '${matchData.setThree == null ? '' : matchData.setThree.split('-')[0]}');
    _awayController3 = TextEditingController(text: '${matchData.setThree == null ? '' : matchData.setThree.split('-')[1]}');
  }
 
  void _showMsg(msg, divisionId, tournamentId, type) {
     
    // flutter defined function
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              backgroundColor: Colors.grey[800],
              content: new Text(msg,
              style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                    ),
              ),
              //content: new Text("Alert Dialog body"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text(FlutterI18n.translate(context, "Close"),),
                  onPressed: () {
                    Navigator.pop(context);
                    if(type==1){
                      Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("$divisionId", "$tournamentId", isComingFromStanding: true)));
                    }
                    
                  },
                ),
              ],
            );
          },
        );
        
  }
  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            FlutterI18n.translate(context, "Enter Result"),
            //'ENTER RESULT',
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
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
            // color: Colors.blue,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                

                /////////Team/////////

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
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
                                      child: widget.match.home.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${widget.match.home.player1.profilePic}',
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
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(bottom: 1.0),
                                    child: ClipOval(
                                      child: widget.match.home.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${widget.match.home.player2.profilePic}',
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
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${widget.match.home.teamName}',
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
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
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
                                      child: widget.match.away.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${widget.match.away.player1.profilePic}',
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
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(bottom: 1.0),
                                    child: ClipOval(
                                      child: widget.match.away.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${widget.match.away.player2.profilePic}',
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
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${widget.match.away.teamName}',
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
                    ],
                  ),
                ),

                /////////Set 1/////////

                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 70,
                  //color: Colors.red,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.fromLTRB(90.0, 10, 0, 0),
                        //color: Colors.red,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 90,
                              width: 80,
                              child: TextField(
                                controller: _homeController1,
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.number,
                                maxLength: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 68.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0',
                                    counterText: "",
                                    hintStyle:
                                        TextStyle(color: Colors.white30)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
                              alignment: Alignment.center,
                              //child: Tab(icon: Icon(Icons.remove),),
                              height: 2.0,
                              width: 8,
                              color: Colors.white,
                            ),
                            Container(
                              //color: Colors.red,
                              alignment: Alignment.center,
                              height: 90,
                              width: 80,
                              child: TextField(
                                controller: _awayController1,
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.number,
                                maxLength: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 68.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0',
                                    counterText: "",
                                    hintStyle:
                                        TextStyle(color: Colors.white30)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 10.0, top: 30),
                        //decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white))),

                        child: Text(
                          FlutterI18n.translate(context, "SET 1"),
                          //'SET 1',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /////////Set 1 end/////////

                /////////Set 2/////////

                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 70,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.fromLTRB(90.0, 10, 0, 0),
                        //color: Colors.red,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 90,
                              width: 80,
                              child: TextField(
                                controller: _homeController2,
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.number,
                                maxLength: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 68.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0',
                                    counterText: "",
                                    hintStyle:
                                        TextStyle(color: Colors.white30)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
                              alignment: Alignment.center,
                              //child: Tab(icon: Icon(Icons.remove),),
                              height: 2.0,
                              width: 8,
                              color: Colors.white,
                            ),
                            Container(
                              //color: Colors.red,
                              alignment: Alignment.center,
                              height: 90,
                              width: 80,
                              child: TextField(
                                controller: _awayController2,
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.number,
                                maxLength: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 68.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0',
                                    counterText: "",
                                    hintStyle:
                                        TextStyle(color: Colors.white30)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 10.0, top: 30),
                        //decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white))),

                        child: Text(
                          FlutterI18n.translate(context, "SET 2"),
                          //'SET 2',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /////////Set 2 end/////////

                /////////Set 3/////////

                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 70,
                  //color: Colors.red,
                  padding: EdgeInsets.only(right: 20, left: 20),
                  //margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        //margin: EdgeInsets.fromLTRB(90.0, 10, 0, 0),
                        //color: Colors.red,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              height: 90,
                              width: 80,
                              child: TextField(
                                controller: _homeController3,
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.number,
                                maxLength: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 68.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0',
                                    counterText: "",
                                    hintStyle:
                                        TextStyle(color: Colors.white30)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(30, 50, 30, 10),
                              alignment: Alignment.center,
                              //child: Tab(icon: Icon(Icons.remove),),
                              height: 2.0,
                              width: 8,
                              color: Colors.white,
                            ),
                            Container(
                              //color: Colors.red,
                              alignment: Alignment.center,
                              height: 90,
                              width: 80,
                              child: TextField(
                                controller: _awayController3,
                                textDirection: TextDirection.ltr,
                                keyboardType: TextInputType.number,
                                maxLength: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 68.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '0',
                                    counterText: "",
                                    hintStyle:
                                        TextStyle(color: Colors.white30)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(bottom: 10.0, top: 30),
                        //decoration: BoxDecoration(border: BorderDirectional(bottom: BorderSide(color: Colors.white))),

                        child: Text(
                          FlutterI18n.translate(context, "SET 3"),
                          //'SET 3',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /////////Set 3 end/////////

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 140,
                          height: 50,
                          child: RaisedButton(
                            child: Text(
                              FlutterI18n.translate(context, "CANCEL"),
                              //'CANCEL',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white30,
                                fontSize: 17.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'BebasNeue',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.white30,
                            elevation: 4.0,
                            splashColor: Colors.blueGrey,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0)),
                            onPressed: () {
                              //Navigator.of(context).pushNamed("/Dashboard");
                            },
                          )),
                      Container(
                          width: 140,
                          height: 50,
                          margin: EdgeInsets.only(left: 10),
                          child: RaisedButton(
                            child: Text(
                              _isAddingResult ? FlutterI18n.translate(context, "SAVING") : FlutterI18n.translate(context, "SAVE"),
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                //color: Colors.white,
                                fontSize: 17.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'BebasNeue',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.white,
                            elevation: 4.0,
                            splashColor: Colors.blueGrey,
                            disabledColor: Colors.grey,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0)),
                            onPressed: (){
                              _updateResult(context);
                            },
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateResult(BuildContext context) async{
   
    var setOne;
    var setTwo;
    var setThree;

    // make the data set 
   
    if(_homeController1.text.isNotEmpty && _awayController1.text.isNotEmpty){
       setOne = '${_homeController1.text}-${_awayController1.text}';
    }
    if(_homeController2.text.isNotEmpty && _awayController2.text.isNotEmpty){
       setTwo = '${_homeController2.text}-${_awayController2.text}';
    }
    if(_homeController3.text.isNotEmpty && _awayController3.text.isNotEmpty){
       setThree = '${_homeController3.text}-${_awayController3.text}';
    }
    
    // validate the set 
    if(setThree !=null){ // then other two sets has to be filled... 
       if(setOne ==null || setTwo ==null) {
          return _showMsg(FlutterI18n.translate(context, "You have forgotten to add set one or set two!"), 0, 0, 0);
       }
    }
    if(setTwo !=null){ // set one has to be filled
       if(setOne == null) {
         return _showMsg(FlutterI18n.translate(context, "You have forgotten to add set one!"), 0, 0, 0);
       }
    }
   

    var data = {
        'setOne':  setOne,
        'setTwo':  setTwo,
        'setThree':  setThree,
        'id' : matchData.id,
        'match_id' : matchData.id,
        'isWo' : 0,
        'over' : matchData.over, 
        'tournament_id' : matchData.tournamentId,
        'division_id' : matchData.divisionId,
        'homeTeamPoint' : matchData.homeTeamPoint,
        'awayTeamPoint' : matchData.awayTeamPoint,
        'homeTeamId' : matchData.homeTeam,
        'awayTeamId' : matchData.awayTeam,

    };
    setState(() {
       _isAddingResult = true;
    });
    var res = await CallApi().postData(data, 'club/edit/result');
    var body = json.decode(res.body);
    if(body['success']){
       print('done'); 
       
       store.dispatch(changeResult(matchData.id, body['data']['point']));
    }
     setState(() {
       _isAddingResult = false;
    });
    
    Navigator.pop(context);
    _showMsg(FlutterI18n.translate(context, "Score has been updated successfully!"), matchData.divisionId, matchData.tournamentId, 1);
   
  
  }
}


