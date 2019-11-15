import 'package:flutter/material.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/screens/americano/americanoScreen.dart';
import 'package:padelmatchv2/screens/eventDetailsScreen/eventDetails.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';

class UpcomingAmericanoCard extends StatelessWidget {
  final tr;
  final int index;
  UpcomingAmericanoCard(this.tr, this.index);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            SlideLeftRoute(page: AmericanoScreen("${tr[index].id}", "${tr[index].league.image.image}")));
        //Navigator.push(context, SlideLeftRoute(page: EventDetails("${event[index].id}")));
         //Navigator.push(context, SlideLeftRoute(page: HomePage()));
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
                    padding: EdgeInsets.fromLTRB(15.0, 15.0, 1.0, 12.0),
                    child: Text(
                      'AMERICANO',
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
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 12.0),
                          alignment: Alignment.centerLeft,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${tr[index].dayName}',
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
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 15,
                                width: 1.5,
                                alignment: Alignment.center,
                                color: Colors.white70,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${tr[index].playingDate}',
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
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 15,
                                width: 1.5,
                                alignment: Alignment.center,
                                color: Colors.white70,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${tr[index].playingTime}',
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
                            onPressed: () {
                              print('object');
                            },
                            icon: Icon(Icons.more_vert, color: Colors.white),
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
                  image: NetworkImage(
                      'http://backoffice.forehand.se${tr[index].league.image.image}'),
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
                  color: Colors.grey[700] //.withOpacity(0.6)
                  ),
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 18, bottom: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${tr[index].tournamentName}',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
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
                      '${tr[index].fee}kr',
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
    );
  }
}
