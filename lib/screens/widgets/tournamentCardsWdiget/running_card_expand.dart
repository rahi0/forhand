import 'package:flutter/material.dart';

class RunningCardExpand extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                alignment: Alignment.center,
                constraints:
                    new BoxConstraints.expand(height: 255.0, width: 380),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/t.jpg'),
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Row(
                  children: <Widget>[


                    Container(
                      margin: EdgeInsets.only(left: 30, top: 50),
                      height: 255.0,
                      width: 190,
                      //color: Colors.blue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 155,
                            alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'WORLD PADEL TOUR',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'BebasNeue',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.fromLTRB(0, 3, 0, 10),
                                      child: Text(
                                        'Henri Leconte Padel Club',
                                        textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 11.0,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 21,
                                      width: 46,
                                      margin: EdgeInsets.only(top: 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(3)),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        height: 21,
                                        width: 46,
                                        margin: EdgeInsets.only(
                                            left: 10, top: 2),
                                        child: Text(
                                          'PADEL',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              
                            
                          ),

                          Container(
                            alignment: Alignment.bottomLeft,
                            //color: Colors.white,
                            child: Stack(
                                    children: <Widget>[
                                      Container(
                                        
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(bottom: 12.0),
                                        child: ClipOval(
                                          child: Image.asset(
                                            'assets/img/c.jpg',
                                            height: 32,
                                            width: 32,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        left: 30,
                                        child: Container(
                                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(bottom: 1.0),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/img/bb.jpg',
                                  height: 32,
                                  width: 32,
                                  fit: BoxFit.cover,
                                ),
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
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(right: 20, top: 50),
                      height: 255.0,
                      width: 115,
                      //color: Colors.red,
                      child: Image.asset(
                        'assets/img/g.png',
                        height: 40,
                        width: 32,
                        //color: Colors.white,
                        //fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              );
  }
}