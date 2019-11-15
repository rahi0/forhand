import 'package:flutter/material.dart';

class CreateTeamInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
            'Team Info',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.0,
              decoration: TextDecoration.none,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
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
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Container(
                   // color: Colors.yellow,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Column(
                      children: <Widget>[

                         Text(
                    'You have created a team ',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 40),
                  ),


                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Text(
                            'Team Name',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.0,
                              decoration: TextDecoration.none,
                              fontFamily: 'BebasNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Container(
                          child: TextField(
                      textDirection: TextDirection.ltr,
                      maxLength: 20,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32.0,
                          decoration: TextDecoration.none,
                          fontFamily: 'BebasNeue',
                          fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                            border: InputBorder.none,
                            counterStyle: TextStyle(color: Colors.white54),
                            hintText: 'Enter Team Name',
                            hintStyle: TextStyle(color: Colors.white30)),
                    ),
                        ),
                      ],
                    ),
                  ),

                      ],
                    ),
                  ),
                 



                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 40.0),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.red,
                    child: Column(
                      children: <Widget>[


                        Container(
                            height: 1.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white54,
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                          ),



                        Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          bottom: 1.0, right: 15),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/img/aaa.jpg',
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      ///color: Colors.red,
                                      alignment: Alignment.centerLeft,
                                      //margin: EdgeInsets.fromLTRB(15, 60, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 4, bottom: 4),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Richard Castle',
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
                                            alignment: Alignment.centerLeft,
                                            //margin: EdgeInsets.fromLTRB(0, 3, 0, 10),
                                            child: Text(
                                              'P3590',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                color: Colors.white54,
                                                fontSize: 15.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),




                          Container(
                            height: 1.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white54,
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                          ),


                         Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10),
                                padding: EdgeInsets.only(left: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                          bottom: 1.0, right: 15),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/img/aa.jpg',
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      ///color: Colors.red,
                                      alignment: Alignment.centerLeft,
                                      //margin: EdgeInsets.fromLTRB(15, 60, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 4, bottom: 4),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Jhon Snow',
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
                                            alignment: Alignment.centerLeft,
                                            //margin: EdgeInsets.fromLTRB(0, 3, 0, 10),
                                            child: Text(
                                              'P3590',
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                color: Colors.white54,
                                                fontSize: 15.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        


                        Container(
                            height: 1.0,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white54,
                            margin: EdgeInsets.only(top: 15, bottom: 20),
                          ),


                        Container(
                            // decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only( bottomRight: Radius.circular(8.0),
                            //                 bottomLeft: Radius.circular(8.0)) ),
                            width: 250,
                            height: 45,
                            margin: EdgeInsets.only(top: 60.0),
                            child: RaisedButton(
                              child: Text(
                                'CONTINUE',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  //color: Colors.white,
                                  fontSize: 21.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'BebasNeue',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              color: Colors.white,
                              elevation: 4.0,
                              splashColor: Colors.blueGrey,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                              onPressed: () {
                                
                              },
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
    );
  }
}
