import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/animatedLoaders/eventDetailsLoader.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/customWidget/dialog.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/model/event/eventDetailsModel.dart';
import 'package:padelmatchv2/model/eventSignedUsers/eventUserLists.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/userList/userListModal.dart';
import 'package:padelmatchv2/screens/widgets/eventSignedupUsers.dart';
import 'package:progress_dialog/progress_dialog.dart';

class EventDetails extends StatefulWidget {
  final id;
  EventDetails(this.id);

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  var eventData;
  bool _isLoading = true;
  bool _isSending = false;
  bool _isRemove = false;
  bool _notInvited = false;

  @override
  void initState() {
    _getEventData();
    super.initState();
  }

  _getEventData() async {
    var res = await CallApi().getData('event/${widget.id}');
    final body = json.decode(res.body);
    print(body);
    var data = EventDetailsModel.fromJson(body);
   // print(body);
    if(data.event.eventstatus==null){
        Navigator.push(context, SlideLeftRoute(page: HomePage()));
        return;
    }

    setState(() {
      eventData = data;
      _isLoading = false;
    });
  }

  ProgressDialog pr;

  void _showMsg(msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          content: new Text(
            msg,
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
              child: new Text(FlutterI18n.translate(context, "Close")),
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
    pr = new ProgressDialog(context, ProgressDialogType.Normal);
    pr.setMessage(FlutterI18n.translate(context, "Please wait"));
    if (_isLoading) {
      return Center(
        child: EventDetailsLoader(),
      );
    }
    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.centerRight,
            end: Alignment.topLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.4, 0.6, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.grey[900],
              Colors.grey[800],
              Colors.grey[600],
              Colors.grey[700],
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Container(
            child: Column(
              children: <Widget>[
                // top image section
                Container(
                  alignment: Alignment.topLeft,
                  height: 239,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          CallApi().baseUrl + '${eventData.event.eventImg}'),
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.3), BlendMode.darken),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                      margin: EdgeInsets.only(left: 15.0, top: 40),
                      child: BackButton(
                        color: Colors.white,
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 15.0),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text('Food Paradise'),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                /////////////////Calender/////////////////

                                Container(
                                  height: 80,
                                  width: 56,
                                  color: Colors.transparent,
                                  //margin: EdgeInsets.only(left: 10, top: 10),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(4.0),
                                              topLeft: Radius.circular(4.0)),
                                          color: Colors.white,
                                        ),
                                        height: 57,
                                        width: 52,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                height: 22.0,
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${eventData.event.monthName}',
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 17.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: 'BebasNeue',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                            Container(
                                                height: 25.0,
                                                //padding: EdgeInsets.only(top: 8.0),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '${eventData.event.dayOfTheMonth}',
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 26.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: 'BebasNeue',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(4.0),
                                                  bottomLeft:
                                                      Radius.circular(4.0)),
                                              color: Colors.transparent),
                                          alignment: Alignment.center,
                                          height: 22,
                                          width: 52,
                                          //margin: EdgeInsets.only(top: 2.0),
                                          //   color: Colors.black,
                                          //         //margin: EdgeInsets.only(top: 44, bottom: 1, left: 1, right: 1),
                                          child: Text(
                                            '${eventData.event.eventTime}',
                                            textDirection: TextDirection.ltr,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'BebasNeue',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                    ],
                                  ),
                                ),

                                /////////////////Calender END/////////////////

                                Expanded(
                                  child: Container(
                                    //color: Colors.yellow,
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.topLeft,
                                          //color: Colors.green,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Expanded(
                                                 child: Container(
                                                   //color: Colors.blue,
                                                  alignment: Alignment.centerLeft,
                                                  child: Text(
                                                    '${eventData.event.eventName}',
                                                    textDirection:
                                                        TextDirection.ltr,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 23.0,
                                                      decoration:
                                                          TextDecoration.none,
                                                      fontFamily: 'BebasNeue',
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                padding:
                                                    EdgeInsets.only(top: 3, left: 5, right: 5),
                                                alignment: Alignment.center,
                                                height: 23,
                                               // width: 70,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                        color:
                                                            Colors.blue[300])),
                                                child: Text(
                                                  '${eventData.event.eventstatus.status}',
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                    color: Colors.blue[300],
                                                    fontSize: 15.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: 'BebasNeue',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //width: 220,
                                          //color: Colors.red,
                                          child: Text(
                                            '${FlutterI18n.translate(context, "Padel Center")} | ${eventData.event.eventLocation}',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 14.0,
                                              decoration: TextDecoration.none,
                                              //fontFamily: 'PermanentMarker',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 1.5,
                                          width: 15,
                                          color: Colors.blueAccent,
                                          //padding: EdgeInsets.only(left: 30.0, right: 30.0),
                                          margin: const EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                        ),
                                        Text(
                                          '${eventData.event.eventDate}',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              fontFamily: 'Lato',
                                              fontSize: 13.0,
                                              decoration: TextDecoration.none,
                                              //fontFamily: 'PermanentMarker',
                                              fontWeight: FontWeight.normal,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        //color: Colors.red,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  eventData.event.acceptedUsers.length> 0 ? GestureDetector(
                                    onTap: () {
                                      _getSignedUsersList();
                                    },
                                    // child: Container(
                                    //   //color: Colors.white70,
                                    //   width: 90,
                                    //   alignment: Alignment.centerLeft,
                                    //   child: Stack(children: userLists()),
                                    // ),

                                    child: EventSignedUpUsers(eventData.event.acceptedUsers),

                                  ) : Container(),
                                  Container(
                                    margin: EdgeInsets.only(left: 3),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${eventData.event.singedupCount} ${FlutterI18n.translate(context, "Signed up")}',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'BebasNeue',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${eventData.event.eventLimit - eventData.event.singedupCount} ${FlutterI18n.translate(context, "Left")}',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontSize: 16.0,
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    //margin: EdgeInsets.only(left: 60),
                                    padding: EdgeInsets.only(top: 3),
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 57,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.blue[600],
                                    ),
                                    child: Text(
                                      '${eventData.event.eventFee} ${FlutterI18n.translate(context, "kr")}',
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
                            )
                          ],
                        ),
                      ),

                      Container(
                        height: 0.5,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[600],
                        //padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        margin: const EdgeInsets.only(top: 25.0, bottom: 20.0),
                      ),

                      Container(
                        //color: Colors.red,
                        alignment: Alignment.topLeft,
                        //padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${eventData.event.eventDescription}',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  height: 1.6,
                                  wordSpacing: 2),
                            )
                          ],
                        ),
                      ),

                      Container(
                        //color: Colors.red,
                        margin: EdgeInsets.only(top: 35, bottom: 70),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(right: 20),
                                width: 144,
                                height: 48,
                                child: eventData.event.eventstatus.status ==
                                        'declined'
                                    ? RaisedButton(
                                        child: Text(
                                          FlutterI18n.translate(context, "DECLINED"),
                                          //'DECLINED',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white,
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
                                            borderRadius:
                                                new BorderRadius.circular(5.0)),
                                        onPressed: null)
                                    : RaisedButton(
                                        child: Text(
                                          _isRemove
                                              ? FlutterI18n.translate(context, "Please wait")
                                              : FlutterI18n.translate(context, "DECLINE"),
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white,
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
                                            borderRadius:
                                                new BorderRadius.circular(5.0)),
                                        onPressed:
                                            _isRemove ? null : _removeInvite)),
                            eventData.event.eventstatus.status != 'accepted'
                                ? Container(
                                    width: 144,
                                    height: 48,
                                    //alignment: Alignment.centerLeft,
                                    child: RaisedButton(
                                        child: Text(
                                          _isSending
                                              ? FlutterI18n.translate(context, "Please wait")
                                              : FlutterI18n.translate(context, "accept"),
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        color: Colors.white,
                                        elevation: 4.0,
                                        splashColor: Colors.blueGrey,
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0)),
                                        onPressed:
                                            _isSending ? null : _acceptInvite))
                                : Container(
                                    width: 144,
                                    height: 48,
                                    //alignment: Alignment.centerLeft,
                                    child: RaisedButton(
                                        child: Text(
                                          FlutterI18n.translate(context, "Accepted"),
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        color: Colors.white,
                                        elevation: 4.0,
                                        splashColor: Colors.blueGrey,
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0)),
                                        onPressed: null))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }


  void _acceptInvite() async {
    setState(() {
      _isSending = true;
    });
    //print(eventData.event.id);
    var data = {
      'id': eventData.event.eventstatus.id,
      'status': 'accepted',
    };

    var res = await CallApi().postData(data, 'event-action');
    var body = json.decode(res.body);
    _showMsg(FlutterI18n.translate(context, "You have accepted the invitation!"));
    setState(() {
      _isSending = false;
      eventData.event.eventstatus.status = 'accepted';
    });
  }

  void _removeInvite() async {
    setState(() {
      _isRemove = true;
    });
    var data = {
      'id': eventData.event.eventstatus.id,
      'status': 'declined',
    };

    var res = await CallApi().postData(data, 'event-action');
    var body = json.decode(res.body);
    _showMsg(FlutterI18n.translate(context, "Invitation has been removed"));
    setState(() {
      _isRemove = false;
      eventData.event.eventstatus.status = 'declined';
    });
  }

  void _getSignedUsersList() async {
    pr.show();
    var res = await CallApi().getData('event-user-list/${widget.id}');
    var body = json.decode(res.body);
    var data = EventUserLists.fromJson(body);
    Future.delayed(Duration(milliseconds: 1)).then((value) {
      pr.hide();
      Navigator.push(context,
          ScaleRoute(page: UserList(data.users, 'Users going to this event')));
    });
  }
}
