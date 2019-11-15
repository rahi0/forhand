import 'package:flutter/material.dart';

//////////////Matches////////////////

class Matchess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Row(
              children: <Widget>[
                Text(
                  'ROUND 1 ',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' COMPLETED',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.cyan[300],
                    fontSize: 15.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5, bottom: 10),
            width: 500,
            decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(6.0)),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, left: 3, right: 1),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin:
                                        EdgeInsets.only(bottom: 1.0, right: 15),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/aa.jpg',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 4),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Jhon Snow',
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
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              width: 150,
                              color: Colors.white54,
                              margin: EdgeInsets.only(top: 15, bottom: 10),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin:
                                        EdgeInsets.only(bottom: 1.0, right: 15),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/c.jpg',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 4),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Theon Grejoy',
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
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              width: 150,
                              color: Colors.white54,
                              margin: EdgeInsets.only(top: 15),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey[800],
                        height: 125,
                        width: 34,
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          height: 22,
                          width: 22,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                          child: Text(
                            'v/s',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin:
                                        EdgeInsets.only(bottom: 1.0, right: 15),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/xx.jpg',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 4),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Arya Stark',
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
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              width: 150,
                              color: Colors.white54,
                              margin: EdgeInsets.only(top: 15, bottom: 10),
                            ),
                            Container(
                              alignment: Alignment.center,
                              //margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin:
                                        EdgeInsets.only(bottom: 1.0, right: 15),
                                    child: ClipOval(
                                      child: Image.asset(
                                        'assets/img/x.jpg',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.only(top: 10, bottom: 4),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Sansa Stark',
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
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              width: 150,
                              color: Colors.white54,
                              margin: EdgeInsets.only(top: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(110.0, 20, 0, 0),
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 32,
                        width: 40,
                        child: Text(
                          '20',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
                        alignment: Alignment.center,
                        height: 2.0,
                        width: 8,
                        color: Colors.white,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 32,
                        width: 40,
                        child: Text(
                          '13',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(150.0, 10.0, 15.0, 15.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'COURT 4',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.normal,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/////////////Matches End////////////
