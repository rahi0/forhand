import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/model/americano/americanoModel.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/redux/thunk.dart';
class AmericanoEnterResult extends StatefulWidget {
  final match;
  final index;
  AmericanoEnterResult(this.match, this.index);
  @override
  _AmericanoEnterResultState createState() => _AmericanoEnterResultState();
}

class _AmericanoEnterResultState extends State<AmericanoEnterResult> {
  bool _isLoading = false;
  var matchData;
  var homeTeamSet;
  var awayTeamSet;
  TextEditingController _homeController;
  TextEditingController _awayController;

  @override
  void initState() {
    super.initState();
    _setIntialInfo();
    
   
  }
  void _setIntialInfo() async{
    print(widget.match);
    
    _homeController = TextEditingController(text: '${widget.match.teamOnePoints == null ? '' : widget.match.teamOnePoints}');
    _awayController = TextEditingController(text: '${widget.match.teamTwoPoints == null ? '' : widget.match.teamTwoPoints}');
  }


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
          elevation: 1,
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
            margin: EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0, bottom: 30),
            padding: EdgeInsets.only(bottom: 40, top: 30, ),
            height: MediaQuery.of(context).size.height,
             //color: Colors.blue,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                

                /////////Team/////////

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                  //margin: EdgeInsets.only(bottom: 60),
                  alignment: Alignment.center,
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 110,
                              //color: Colors.red,
                              //alignment: Alignment.centerLeft,
                              child: Stack(
                                      children: <Widget>[
                                        Container(
                                          //alignment: Alignment.topLeft,
                                          //margin: EdgeInsets.only(bottom: 12.0),
                                          child: ClipOval(
                                            child: widget.match.player1.profilePic != null ? Image.network(
                                                            CallApi().baseUrl+'${widget.match.player1.profilePic}',
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
                                          left: 50,
                                          child: Container(
                                            //alignment: Alignment.topLeft,
                                            //margin: EdgeInsets.only(bottom: 1.0),
                                            child: ClipOval(
                                              child: widget.match.player2.profilePic != null ? Image.network(
                                                            CallApi().baseUrl+'${widget.match.player2.profilePic}',
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
                                        ),
                                      ],
                                    ),
                            ),

                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${widget.match.player1.firstName}',
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

                              Container(
                                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${widget.match.player2.firstName}',
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
                                ],
                              ),
                            )
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 110,
                              //alignment: Alignment.centerLeft,
                              child: Stack(
                                      children: <Widget>[
                                        Container(
                                          //alignment: Alignment.topLeft,
                                          //margin: EdgeInsets.only(bottom: 12.0),
                                          child: ClipOval(
                                            child: widget.match.player3.profilePic != null ? Image.network(
                                                            CallApi().baseUrl+'${widget.match.player3.profilePic}',
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
                                          left: 50,
                                          child: Container(
                                            //alignment: Alignment.topLeft,
                                            //margin: EdgeInsets.only(bottom: 1.0),
                                            child: ClipOval(
                                              child: widget.match.player4.profilePic != null ? Image.network(
                                                            CallApi().baseUrl+'${widget.match.player4.profilePic}',
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
                                        ),
                                      ],
                                    ),
                            ),


                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${widget.match.player3.firstName}',
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

                              Container(
                                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${widget.match.player4.firstName}',
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
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                /////////Set /////////

                Container(
                  width: MediaQuery.of(context).size.width,
                  //height: 70,
                  //color: Colors.red,
                  padding: EdgeInsets.only(right: 30, left: 30,top: 30, bottom: 20),
                  //margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 93,
                        width: 75,
                        child: TextField(
                          controller: _homeController,
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
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        alignment: Alignment.center,
                        //child: Tab(icon: Icon(Icons.remove),),
                        height: 2.0,
                        width: 8,
                        color: Colors.white,
                      ),
                      Container(
                        //color: Colors.red,
                        alignment: Alignment.center,
                        height: 93,
                        width: 75,
                        child: TextField(
                          controller: _awayController,
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
                      SizedBox(
                        width: 7,
                      ),
                    ],
                  ),
                ),

                /////////Set end////////


                /////////Buttons///////

                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(top: 70),
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
                              _isLoading ? FlutterI18n.translate(context, "SAVING"): FlutterI18n.translate(context, "SAVE"),
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
                            onPressed: _isLoading? null : _addResult,
                          ))
                    ],
                  ),
                ),

                /////////Buttons end/////
                
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _addResult() async{
    if(_homeController.text.isEmpty){
       return _showMsg(FlutterI18n.translate(context, "Please add home team score"));
    }
    if(_awayController.text.isEmpty){
       return _showMsg(FlutterI18n.translate(context, "Please add away team score"));
    }

    // check if the total number of points equal to the number given in settings... 
    


    setState(() {
       _isLoading = true;
    });
      var data = {
          'teamOnePoints' : _homeController.text, 
          'teamTwoPoints' : _awayController.text, 
          'id': widget.match.id,
          'playerOne': widget.match.playerOne,
          'playerThree': widget.match.playerThree,
          'playerTwo': widget.match.playerTwo,
          'playerFour':widget.match.playerFour,
          'round': 'Round ${widget.index}',
          'groupName': widget.match.groupName,
          'tournament_id': widget.match.tournamentId,
          'over': 1
      };
     
      var res = await CallApi().postData(data, 'add-americano-result');
      var body = json.decode(res.body);
      if(body['success']){
           var americanoPoints = AmericanoPoints.fromJson(body['points']); 
            store.dispatch(changeAmericanoResult(widget.match.id, body));
            store.dispatch(AmericanoRanks(americanoPoints.ranks));
            setState(() {
              _isLoading = false;
            });
            Navigator.pop(context);
            _showMsg(body['msg']);
      }else{
          _showMsg(body['msg']);
          setState(() {
              _isLoading = false;
            });
      }
     
  }
}


