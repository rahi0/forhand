import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/screens/eventDetailsScreen/eventDetails.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/widgets/eventSignedupUsers.dart';

class UpcomingEventCard extends StatelessWidget {
  final event;
  final int index;
  UpcomingEventCard(this.event, this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, SlideLeftRoute(page: EventDetails("${event[index].id}")));
      },
          child: Container(
        margin: EdgeInsets.only(top: 15),
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10, right: 10),
        //color: Colors.red,
        //constraints: new BoxConstraints.expand(height: 250.0, width: 352),
        // decoration: BoxDecoration(color: Colors.white),
        //width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            /////////Top///////
            
            Container(
                            alignment: Alignment.center,
                            width: 500,
                            //height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
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
                                      EdgeInsets.fromLTRB(15.0, 15.0, 1.0, 12.0),
                                  child: Text(
                                    FlutterI18n.translate(context, "EVENT"),
                                    //'EVENT',
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
                                  padding:EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 12.0),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${event[index].dayName}',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 17.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 5.0, right: 5.0),
                                        height: 15,
                                        width: 1.5,
                                        alignment: Alignment.center,
                                        color: Colors.white70,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${event[index].playingDate}',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 17.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 5.0, right: 5.0),
                                        height: 15,
                                        width: 1.5,
                                        alignment: Alignment.center,
                                        color: Colors.white70,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '${event[index].eventTime}',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 17.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
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
            ////////Top End//////
            Container(
              //constraints: BoxConstraints.expand(height: 146.0, width: 352),
              width: MediaQuery.of(context).size.width,
              height: 146,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('http://backoffice.forehand.se${event[index].eventImg}'),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              //constraints: BoxConstraints.expand(height: 104.0, width: 352),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  color: Colors.grey[700]//.withOpacity(0.6)
                  ),
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                     child: Container(
                      //height: 104,
                      //width: MediaQuery.of(context).size.width,
                      //color: Colors.red,
                      padding: EdgeInsets.only(top: 15, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                    //color: Colors.blue,
                                    alignment: Alignment.centerLeft,
                                   // width: 180,
                                    child: Text(
                                      '${event[index].eventName}',
                                      
                                      textDirection: TextDirection.ltr,
                                      //textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'BebasNeue',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.only(top: 3, right: 5, left: 5),
                                  alignment: Alignment.center,
                                  height: 23,
                                  //width: 70,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.transparent,
                                      border: Border.all(color: Colors.blue[300])),
                                  child: Text(
                                    FlutterI18n.translate(context, "Accepted"),
                                    //'Accepted',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'BebasNeue',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '${event[index].eventLocation.toLowerCase()}',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.normal,
                                
                              ),
                              
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[

                                      EventSignedUpUsers(event[index].acceptedUsers),
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: 3),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${event[index].singedupCount} ${FlutterI18n.translate(context, "Signed up")}',
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
                                        margin: EdgeInsets.only(left: 5),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '${event[index].eventLimit - event[index].singedupCount} ${FlutterI18n.translate(context, "Left")}',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 17.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                                Container(
                          //margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.only(top: 3),
                          alignment: Alignment.center,
                          height: 30,
                          width: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.blue[600],
                          ),
                          child: Text(
                            '${event[index].eventFee}kr',
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
                  ),
                  // Container(
                  //   height: 104,
                  //   width: 70,
                  //   padding: EdgeInsets.only(top: 60),
                  //   //color: Colors.yellow,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       Container(
                  //         //margin: EdgeInsets.only(left: 10),
                  //         padding: EdgeInsets.only(top: 3),
                  //         alignment: Alignment.center,
                  //         height: 30,
                  //         width: 57,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(3),
                  //           color: Colors.blue[600],
                  //         ),
                  //         child: Text(
                  //           '${event[index].eventFee}kr',
                  //           textDirection: TextDirection.ltr,
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 19.0,
                  //             decoration: TextDecoration.none,
                  //             fontFamily: 'BebasNeue',
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
