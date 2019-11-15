import 'package:flutter/material.dart';

class Rank extends StatelessWidget {
  final rank; 
  final index; 
  Rank(this.rank, this.index);
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
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(6.0)),
            margin: EdgeInsets.only(bottom: 5),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 15.0, 7.0),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 5, right: 3),
                      alignment: Alignment.center,
                      child: Text(
                        '${index+1}',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(1.0, 15.0, 10.0, 7.0),
                      child: Image.asset(
                        'assets/img/tir.png',
                        height: 10.0,
                        width: 10.0,
                        //fit: BoxFit.cover,
                      ),
                    ),
                    Container(),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      //color: Colors.yellow,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(bottom: 1.0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/img/c.jpg',
                                height: 42,
                                width: 42,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 35,
                            child: Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(bottom: 1.0),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/img/bb.jpg',
                                  height: 42,
                                  width: 42,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 130,
                      //color: Colors.white54,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 7.0),
                      child: Text(
                        '${rank[index].team.teamName}',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
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
                //height: 30,
                width: 40,
                //color: Colors.red,
                  margin: EdgeInsets.only(left: 20, top: 30),
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        //padding: EdgeInsets.fromLTRB(45.0, 17.0, 2.0, 7.0),
                        child: Text(
                          '${rank[index].points}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(2.0, 12.0, 0.0, 0.0),
                        child: Text(
                          '${rank[index].matchePlayed}',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
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
    ));
  }
}
