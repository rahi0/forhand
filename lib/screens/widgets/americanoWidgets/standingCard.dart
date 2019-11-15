import 'package:flutter/material.dart';
import 'package:padelmatchv2/api/api.dart';

class StandingPlayerCard extends StatelessWidget {
  final index;
  final ranks;
  StandingPlayerCard(this.ranks, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
          onTap: () {
            //Navigator.of(context).pushNamed("/Login");
            print("working dude");
            // _modalBottomSheetMenu(context);
            //Navigator.of(context).pushNamed("/Standings");
          },
          child: Container(
            padding: EdgeInsets.only(right: 13, left: 13, top: 20, bottom: 20),
            //height: 96,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(6.0)),
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //padding: EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 7.0),
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          //color: Colors.red,
                          margin: EdgeInsets.only( right: 10,),
                          alignment: Alignment.center,
                          child: Text(
                            '$index',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          //color: Colors.yellow,
                          //margin: EdgeInsets.only(bottom: 1.0),
                          child: ClipOval(
                            child: ranks.player.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${ranks.player.profilePic}',
                                                          height: 45,
                                                          width: 45,
                                                        )
                           :Image.asset(
                              'assets/img/b.jpg',
                              height: 45,
                              width: 45,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          //color: Colors.red,
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                //color: Colors.blue,
                                width: 180,
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Text(
                                    '${ranks.player.firstName} ${ranks.player.lastName}',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'BebasNeue',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                              Container(
                                //color: Colors.red,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    PointBox(ranks.round1),
                                    PointBox(ranks.round2),
                                    PointBox(ranks.round3),
                                    PointBox(ranks.round4),
                                    PointBox(ranks.round5),
                                    PointBox(ranks.round6),
                                    PointBox(ranks.round7),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    //color: Colors.blue,
                    //padding: EdgeInsets.fromLTRB(5.0, 0.0, 2.0, 7.0),
                    child: Text(
                      '${ranks.total}',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ]),
          )),
    ));
  }
}

////////////////Box//////////

class PointBox extends StatelessWidget {
  final round;
  PointBox(this.round);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      width: 25,
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Text(
        '$round',
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white54,
          fontSize: 15.0,
          decoration: TextDecoration.none,
          fontFamily: 'BebasNeue',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
