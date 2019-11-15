import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/screens/createTeamScreen/createTeamInfo.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';

class CreateTeam extends StatefulWidget {
  @override
  _CreateTeamState createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  bool _isLoading = false; 
  bool _isPlayerFound = false; 
  var otherPlayer; 

  final TextEditingController partnerId = TextEditingController();
   void _showMsg(msg) {
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
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            FlutterI18n.translate(context, "Create a Team"),
            //'Create a Team',
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
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Container(
            //color: Colors.red,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  //color: Colors.red,
                  //margin: EdgeInsets.only(left: 70.0, top: 10.0, right: 70.0),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(left: 20.0, top: 70.0, right: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                top: 10.0,
                              ),
                              child: Text(
                                FlutterI18n.translate(context, "Enter the player ID of your partner"),
                                //'Enter the player ID of your partner',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 40.0),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  /////// Text Field //////

                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                            FlutterI18n.translate(context, "Enter Player ID"),
                                            //'Enter Player ID',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.white54,
                                              wordSpacing: 1,
                                              letterSpacing: 0.5,
                                              fontSize: 19.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'BebasNeue',
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          child: TextField(
                                            controller: partnerId,
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'Lato',
                                              fontWeight: FontWeight.normal,
                                            ),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'type here',
                                                hintStyle: TextStyle(
                                                    color: Colors.white30)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  ////// Text Field //////
                                ],
                              ),
                            ),

                            ///////////// Searched Partner end//////////
                            
                          !_isPlayerFound ? Container() :
                            Container(
                              margin: EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      FlutterI18n.translate(context, "Your Partner"),
                                     // 'Your Partner',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 17.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'BebasNeue',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Container(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/img/aaa.jpg',
                                                height: 60,
                                                width: 60,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            ///color: Colors.red,
                                            alignment: Alignment.centerLeft,
                                            margin: EdgeInsets.fromLTRB(
                                                15, 0, 0, 0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 4, bottom: 4),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    'Richard Castle',
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily: 'BebasNeue',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  //margin: EdgeInsets.fromLTRB(0, 3, 0, 10),
                                                  child: Text(
                                                    'P3590',
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    style: TextStyle(
                                                      color: Colors.white54,
                                                      fontSize: 16.0,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily: 'Lato',
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ///////////// Searched Partner end//////////
                          ],
                        ),
                      ),

                      ///////////// Search & Continue Button  start//////////

                      Container(
                          width: 256,
                          height: 45,
                          margin: EdgeInsets.only(top: 70.0),
                          child: RaisedButton(
                            child: Text(
                              _isLoading? FlutterI18n.translate(context, "Searching"): FlutterI18n.translate(context, "Search"),
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 21.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'BebasNeue',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.white,
                            elevation: 4.0,
                            splashColor: Colors.blueGrey,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0)),
                            onPressed: _isLoading ? null : _getPlayerInfo
                          ))

                      ///////////// Search & Continue Button  end//////////
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void _getPlayerInfo() async {
      if(partnerId.text.isEmpty){
        return _showMsg(FlutterI18n.translate(context, "Please add your partner ID"),);
      }
      var data = {
        "playerId": partnerId.text
      };
      setState(() {
         _isLoading = true;
      });
      var res = await CallApi().postData(data, 'get-player-info');
      var body = json.decode(res.body);
      if(!body['success']){
        _showMsg(body['msg']);
      }else{
        setState(() {
            otherPlayer = body['player'];
            _isPlayerFound = true;

        });
      }
      print(body);
      setState(() {
         _isLoading = false;
      });
  }

}
