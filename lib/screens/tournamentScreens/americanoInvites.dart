import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/screens/AmericanoEventDetails/americanoEventDetails.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';

class AmericanoInvitation extends StatefulWidget {
  var tr;
  AmericanoInvitation(this.tr); 
  @override
  _AmericanoInvitationState createState() => _AmericanoInvitationState();
}

class _AmericanoInvitationState extends State<AmericanoInvitation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,

          child: Column(
            children: <Widget>[
              AmericanoInvitationCard(widget.tr),
              //InvitationCard(tr),
             
            ],
          ),
        ),
      ),
    );
  }
}




///////




class AmericanoInvitationCard extends StatelessWidget {
  var americnoInvites;
  AmericanoInvitationCard(this.americnoInvites); 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, SlideLeftRoute(page: AmericanoEventDetails(americnoInvites)));
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
            Container(
              //constraints: BoxConstraints.expand(height: 146.0, width: 352),
              width: MediaQuery.of(context).size.width,
              height: 146,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                  image:NetworkImage(
                      CallApi().baseUrl+'${americnoInvites.league.image.image}'),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken
                      ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 65,
                    width: 44,
                    color: Colors.transparent,
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4.0),
                                topLeft: Radius.circular(4.0)),
                            color: Colors.white,
                          ),
                          height: 45,
                          width: 44,
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height: 20.0,
                                  padding: EdgeInsets.only(top: 5.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${americnoInvites.monthName}',
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'BebasNeue',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Container(
                                  height: 23.0,
                                  //padding: EdgeInsets.only(top: 8.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${americnoInvites.dayOfTheMonth}",
                                   //'dayOfTheMonth',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'BebasNeue',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(4.0),
                                    bottomLeft: Radius.circular(4.0)),
                                color: Colors.transparent),
                            alignment: Alignment.center,
                            height: 20,
                            width: 44,
                            //margin: EdgeInsets.only(top: 2.0),
                            //   color: Colors.black,
                            //         //margin: EdgeInsets.only(top: 44, bottom: 1, left: 1, right: 1),
                            child: Text(
                              "${americnoInvites.dayName}",
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'BebasNeue',
                                fontWeight: FontWeight.bold,
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              //constraints: BoxConstraints.expand(height: 104.0, width: 352),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  color: Colors.grey[800].withOpacity(0.6)
                  ),
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Container(
                //height: 104,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${americnoInvites.tournamentName}",
                                
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.left,
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
                            padding: EdgeInsets.only(top: 3, left: 5, right: 5),
                            alignment: Alignment.center,
                            height: 23,
                            //width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: Colors.transparent,
                                border: Border.all(color: Colors.blue[300])),
                            child: Text(
                              "${americnoInvites.invitation.status}",
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
                      //padding: EdgeInsets.only(right: 20),
                      //color: Colors.red,
                      alignment: Alignment.topLeft,
                      child: Text(
                        FlutterI18n.translate(context, "Padel Center"),
                        //'Padel Center',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(top: 5, right: 10),
                      //color: Colors.red,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${americnoInvites.city}",
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),

                    Container(
                      //color: Colors.blue,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[



                                // event.acceptedUsers.length> 0 ? GestureDetector(
                                //   onTap: (){
                                    
                                //   },
                                //   //child: EventSignedUpUsers(event.acceptedUsers)
                                // ) : 
                                Container(),

                                Container(
                                  margin: EdgeInsets.only(left: 3),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${americnoInvites.singedupCount} ${FlutterI18n.translate(context, "Signed up")}',
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
                                    '${americnoInvites.numberOfPlayers - americnoInvites.singedupCount} ${FlutterI18n.translate(context, "Left")}',
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
                            "${americnoInvites.fee}kr",
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
            )
          ],
        ),
      ),
    );
  }

 
}
