import 'package:flutter/material.dart';
import 'package:padelmatchv2/screens/divranks/DivRankHomePage.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';

class CurrentStand extends StatelessWidget {
  final divData;
  final int index;
  CurrentStand(this.divData, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
              onTap: () {
                //Navigator.pushNamed(context, "/divrank/${divData[index].divId}/${divData[index].trId}");
                 Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${divData[index].divId}", "${divData[index].trId}", isComingFromStanding: true)));
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              //color: Colors.red,
                              padding: EdgeInsets.fromLTRB(13.0, 10.0, 3.0, 7.0),
                              //width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    //color: Colors.red,
                                    width: 110,
                                    child: Text(
                                      '${divData[index].tournamentName}',
                                      maxLines: 1,
                                      textDirection: TextDirection.ltr,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'BebasNeue',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '${divData[index].divisionName}',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
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
                        height: 45,
                        width: 0.5,
                        alignment: Alignment.center,
                        //margin: EdgeInsets.only(left: 10, right: 0),
                        color: Colors.grey[400],
                      ),
                      Container(
                        //color: Colors.red,
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 7.0),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                               '${divData[index].position}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 21.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(1.0, 10.0, 5.0, 7.0),
                              child: Image.asset(
                                'assets/img/tir.png',
                                height: 8.0,
                                width: 8.0,
                                //fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.fromLTRB(10.0, 6.0, 1.0, 7.0),
                              child: Text(
                                '${divData[index].teamName}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.black,
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
                          ],
                        ),
                      ),
                      



                      Container(
                          alignment: Alignment.center,
                          //color: Colors.red,
                          //padding: EdgeInsets.only(top: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 10.0, 2.0, 7.0),
                                child: Text(
                                   '${divData[index].points}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 21.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 24.0, 15.0, 0.0),
                                child: Text(
                                  '${divData[index].matchPlayed}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ]),
              )),
    );
  }
}