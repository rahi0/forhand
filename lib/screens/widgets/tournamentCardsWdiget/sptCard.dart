import 'package:flutter/material.dart';


class SPTCard extends StatefulWidget {
  @override
  _SPTCardState createState() => _SPTCardState();
}

class _SPTCardState extends State<SPTCard> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                //Navigator.pushNamed(context, "/divrank/${match[index].div.id}/${match[index].trId}");
                 //Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${match[index].div.id}", "${match[index].trId}")));
                 setState(() {
            if(open == false) {
                 open = true;
            }else{
               open = false;
            }
           
            
         });
              },
          child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      //height: 100,
                      //color: Colors.grey,
                      // decoration: BoxDecoration(
                      //     color: Colors.red,
                      //     borderRadius: BorderRadius.circular(6.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                          height: 500,
                           width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                //color: Colors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/1spt.jpg",),
                                  fit: BoxFit.cover
                                )
                                ),

                            // child: Image.asset(
                            //   "assets/img/1spt.jpg",
                            //    fit: BoxFit.cover,
                            // ),
                          ),

                          //////////////Hidden Section end/////////////
                        

                         open != false ? SptHiddenSection() : Container()

                          //////////////Hidden Section end/////////////
                        ],
                      ),
                    ),
    );
  }
}


///////Hidden Class////

class SptHiddenSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: <Widget>[
          Container(
            //color: Colors.red,
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 10, bottom: 5, right: 10),
            child: Text(
                                                  'OSA: 3 JAN 2019 18:00',
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                    fontFamily: 'BebasNeue',
                                                    fontSize: 13.0,
                                                    decoration: TextDecoration.none,
                                                    //fontFamily: 'PermanentMarker',
                                                    fontWeight: FontWeight.normal,
                                                    color: Colors.white,
                                                  ),
                                                ),
          ),

          ///////
          
          Container(
                        padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                        alignment: Alignment.center,
                       // color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Text('Food Paradise'),
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
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
                                                border: Border.all(color: Colors.white),
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
                                                        'jan',
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
                                                        '29',
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
                                                    border:
                                                        Border.all(color: Colors.white),
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
                                                  '18:00',
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                alignment: Alignment.topLeft,
                                                //color: Colors.green,
                                                child: Text(
                                                  'Umea spt open',
                                                  textDirection: TextDirection.ltr,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25.0,
                                                    decoration: TextDecoration.none,
                                                    fontFamily: 'BebasNeue',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                //width: 220,
                                                //color: Colors.red,
                                                child: Text(
                                                  'Padelcenter | Umea Padelklubb | Umea',
                                                  textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                    fontFamily: 'Lato',
                                                    fontSize: 13.0,
                                                    decoration: TextDecoration.none,
                                                    //fontFamily: 'PermanentMarker',
                                                    fontWeight: FontWeight.normal,
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
                                                'Friday   29 January   18:00',
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


                            ///////////////joined and kr start//////////
                            Container(
                             // color: Colors.red,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        GestureDetector(

                                    onTap: (){
                                       //_getSignedUsersList();
                                    },
                                   child: Container(
                                    //color: Colors.white70,
                                    width: 90,
                                    alignment: Alignment.centerLeft,
                                    child: Stack(
                                      children: <Widget>[
                                          Container(
                                            alignment: Alignment.topLeft,
                                            // margin: EdgeInsets.only(bottom: 12.0),
                                            child: ClipOval(
                                              child: Image.asset(
                                                'assets/img/x.jpg',
                                                height: 32,
                                                width: 32,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 27,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              // margin: EdgeInsets.only(bottom: 1.0),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/img/bb.jpg',
                                                  height: 32,
                                                  width: 32,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 54,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              //margin: EdgeInsets.only(bottom: 1.0),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/img/xx.jpg',
                                                  height: 32,
                                                  width: 32,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                        ),
                                  Container(
                                    margin: EdgeInsets.only(left: 3),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '10 Signed up',
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
                                      '3 Left',
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
                                          margin: EdgeInsets.only(bottom: 3),
                                          child: Text(
                                      'PriceMoney',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        decoration: TextDecoration.none,
                                        fontFamily: 'BebasNeue',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                        ),

                                        Container(
                                          //margin: EdgeInsets.only(left: 60),
                                          padding: EdgeInsets.only(top: 8, right: 10, left: 10, bottom: 5),
                                          alignment: Alignment.center,
                                          //height: 30,
                                          //width: 57,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                            color: Colors.blue[600],
                                          ),
                                          child: Text(
                                            '30,000 KR',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'BebasNeue',
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                            ///////////////joined and kr end//////////

                            Container(
                              height: 0.5,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey[600],
                              //padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              margin: const EdgeInsets.only(top: 25.0, bottom: 20.0),
                            ),


                           /////////Description start///////////

                            Container(
                              //color: Colors.blue,
                              alignment: Alignment.topLeft,
                              //padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 2),
                                    child: Text(
                                          'TavlingSinfoemation',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'BebasNeue',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              ),
                                        ),
                                  ),

                                  /////// list
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        /////// 1
                                        Container(
                                          margin: EdgeInsets.only(top: 3, bottom: 2),
                                          child: Text(
                                            '-- Tavling: Umea Spt open',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                                ),
                                          ),
                                        ),


                                        /////// 2
                                        Container(
                                          margin: EdgeInsets.only(top: 3, bottom: 2),
                                          child: Text(
                                            '-- Spt Klasser : Herrar A, Damer A, Herrar 45 och Damer 45',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                                ),
                                          ),
                                        ),


                                        /////// 3
                                        Container(
                                          margin: EdgeInsets.only(top: 3, bottom: 2),
                                          child: Text(
                                            '-- Sanktionerade Klasser : Herrar b och Damer b',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                                ),
                                          ),
                                        ),

                                        /////// 4
                                        Container(
                                          margin: EdgeInsets.only(top: 3, bottom: 2),
                                          child: Text(
                                            '-- Ovriga Klasser : Herrar c och Damer c',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                                ),
                                          ),
                                        ),

                                        /////// 5
                                        Container(
                                          margin: EdgeInsets.only(top: 3, bottom: 2),
                                          child: Text(
                                            '-- Arrangor : Umea PAdelklubb',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                                ),
                                          ),
                                        ),


                                        /////// 6
                                        Container(
                                          margin: EdgeInsets.only(top: 3, bottom: 2),
                                          child: Text(
                                            '-- Stad : Umea',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                                ),
                                          ),
                                        ),



                                        /////// 7
                                        Container(
                                          margin: EdgeInsets.only(top: 3, bottom: 2),
                                          child: Text(
                                            "-- Prispengar : 30,000kr (15'/15')",
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.normal,
                                                color: Colors.white,
                                                ),
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /////////Description end///////////



                            ////////Button Start////////

                            Container(
                              //color: Colors.red,
                              margin: EdgeInsets.only(top: 35, bottom: 35), 
                              height: 45,
                              width: MediaQuery.of(context).size.width, 
                              child: RaisedButton(
                                onPressed : (){

                                  },
                                color: Colors.white,
                                  elevation: 4.0,
                                  splashColor: Colors.blueGrey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(5.0)),
                                  child: Text(
                                  'Add Partner',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'BebasNeue',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  
                                ),
                            ),

                            ////////Button end////////
                          ],
                        ),
                      ),
        ],
      ),
    );
  }
}


///////Hidden Class End////







/////////All Temporary SPT Pic///////

///2

class SPTCard2 extends StatefulWidget {
  @override
  _SPTCard2State createState() => _SPTCard2State();
}

class _SPTCard2State extends State<SPTCard2> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                //Navigator.pushNamed(context, "/divrank/${match[index].div.id}/${match[index].trId}");
                 //Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${match[index].div.id}", "${match[index].trId}")));
                 setState(() {
            if(open == false) {
                 open = true;
            }else{
               open = false;
            }
           
            
         });
              },
          child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      //height: 100,
                      //color: Colors.grey,
                      decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                          height: 500,
                           width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                //color: Colors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/2spt.jpg",),
                                  fit: BoxFit.cover
                                )
                                ),

                            // child: Image.asset(
                            //   "assets/img/1spt.jpg",
                            //    fit: BoxFit.cover,
                            // ),
                          ),

                          //////////////Hidden Section end/////////////
                        

                         open != false ? SptHiddenSection() : Container()

                          //////////////Hidden Section end/////////////
                        ],
                      ),
                    ),
    );
  }
}



///3

class SPTCard3 extends StatefulWidget {
  @override
  _SPTCard3State createState() => _SPTCard3State();
}

class _SPTCard3State extends State<SPTCard3> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                //Navigator.pushNamed(context, "/divrank/${match[index].div.id}/${match[index].trId}");
                 //Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${match[index].div.id}", "${match[index].trId}")));
                 setState(() {
            if(open == false) {
                 open = true;
            }else{
               open = false;
            }
           
            
         });
              },
          child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      //height: 100,
                      //color: Colors.grey,
                      decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                          height: 500,
                           width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                //color: Colors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/3spt.jpg",),
                                  fit: BoxFit.cover
                                )
                                ),

                            // child: Image.asset(
                            //   "assets/img/1spt.jpg",
                            //    fit: BoxFit.cover,
                            // ),
                          ),

                          //////////////Hidden Section end/////////////
                        

                         open != false ? SptHiddenSection() : Container()

                          //////////////Hidden Section end/////////////
                        ],
                      ),
                    ),
    );
  }
}





///4

class SPTCard4 extends StatefulWidget {
  @override
  _SPTCard4State createState() => _SPTCard4State();
}

class _SPTCard4State extends State<SPTCard4> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                //Navigator.pushNamed(context, "/divrank/${match[index].div.id}/${match[index].trId}");
                 //Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${match[index].div.id}", "${match[index].trId}")));
                 setState(() {
            if(open == false) {
                 open = true;
            }else{
               open = false;
            }
           
            
         });
              },
          child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      //height: 100,
                      //color: Colors.grey,
                      decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                          height: 500,
                           width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                //color: Colors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/4spt.jpg",),
                                  fit: BoxFit.cover
                                )
                                ),

                            // child: Image.asset(
                            //   "assets/img/1spt.jpg",
                            //    fit: BoxFit.cover,
                            // ),
                          ),

                          //////////////Hidden Section end/////////////
                        

                         open != false ? SptHiddenSection() : Container()

                          //////////////Hidden Section end/////////////
                        ],
                      ),
                    ),
    );
  }
}




///5

class SPTCard5 extends StatefulWidget {
  @override
  _SPTCard5State createState() => _SPTCard5State();
}

class _SPTCard5State extends State<SPTCard5> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                //Navigator.pushNamed(context, "/divrank/${match[index].div.id}/${match[index].trId}");
                 //Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${match[index].div.id}", "${match[index].trId}")));
                 setState(() {
            if(open == false) {
                 open = true;
            }else{
               open = false;
            }
           
            
         });
              },
          child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      //height: 100,
                      //color: Colors.grey,
                      decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                          height: 500,
                           width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                //color: Colors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/5spt.jpg",),
                                  fit: BoxFit.cover
                                )
                                ),

                            // child: Image.asset(
                            //   "assets/img/1spt.jpg",
                            //    fit: BoxFit.cover,
                            // ),
                          ),

                          //////////////Hidden Section end/////////////
                        

                         open != false ? SptHiddenSection() : Container()

                          //////////////Hidden Section end/////////////
                        ],
                      ),
                    ),
    );
  }
}





///6

class SPTCard6 extends StatefulWidget {
  @override
  _SPTCard6State createState() => _SPTCard6State();
}

class _SPTCard6State extends State<SPTCard6> {
  bool open = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                //Navigator.pushNamed(context, "/divrank/${match[index].div.id}/${match[index].trId}");
                 //Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${match[index].div.id}", "${match[index].trId}")));
                 setState(() {
            if(open == false) {
                 open = true;
            }else{
               open = false;
            }
           
            
         });
              },
          child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      //height: 100,
                      //color: Colors.grey,
                      decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(6.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                          height: 500,
                           width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                //color: Colors.blue,
                                image: DecorationImage(
                                  image: AssetImage("assets/img/6spt.jpg",),
                                  fit: BoxFit.cover
                                )
                                ),

                            // child: Image.asset(
                            //   "assets/img/1spt.jpg",
                            //    fit: BoxFit.cover,
                            // ),
                          ),

                          //////////////Hidden Section end/////////////
                        

                         open != false ? SptHiddenSection() : Container()

                          //////////////Hidden Section end/////////////
                        ],
                      ),
                    ),
    );
  }
}