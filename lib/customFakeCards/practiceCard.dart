import 'package:flutter/material.dart';


class PracticeCard extends StatefulWidget {
  @override
  _PracticeCardState createState() => _PracticeCardState();
}

class _PracticeCardState extends State<PracticeCard> {
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
                      margin: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 5),
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
                           width: MediaQuery.of(context).size.width,
                            //height: 50,
                            decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(6.0),
                                    topRight: Radius.circular(6.0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  //color: Colors.red,
                                  alignment: Alignment.centerLeft,
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 17.0, 1.0, 12.0),
                                  child: Text(
                                    'Padel - Group Practice',
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
                                  //color: Colors.red,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                  padding:EdgeInsets.fromLTRB(10.0, 15.0, 0.0, 12.0),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Sat | 26 July | 12:00',
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
                          Container(),

                          ////////////////////////////////////////////
                          Container(
                            //color: Colors.red,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              children: <Widget>[
                                Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'PadelCenter | Gotborg',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),


                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        //color: Colors.red,
                                        padding: EdgeInsets.only(left: 10, right: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              //color: Colors.red,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                      alignment: Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          right: 5.0),
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
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Container(
                                                          alignment: Alignment.centerLeft,
                                                          width: 80,
                                                          //color: Colors.yellow,
                                                          child: Text(
                                                            'Jhon Whick',
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
                                                          alignment: Alignment.centerLeft,
                                                          width: 80,
                                                          child: Text(
                                                            'Head Pro',
                                                            textDirection: TextDirection.ltr,
                                                            style: TextStyle(
                                                              color: Colors.blue,
                                                              fontSize: 14.0,
                                                              decoration: TextDecoration.none,
                                                              fontFamily: 'BebasNeue',
                                                              fontWeight: FontWeight.bold,
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
                                              //color: Colors.green,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(right: 5),
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          '15 out of 16 joined',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 13.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                                  Container(
                                                      alignment: Alignment.topLeft,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          'assets/img/aaa.jpg',
                                                          height: 25,
                                                          width: 25,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          'assets/img/bb.jpg',
                                                          height: 25,
                                                          width: 25,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          'assets/img/d.jpg',
                                                          height: 25,
                                                          width: 25,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          'assets/img/sadek-plus.png',
                                                          height: 25,
                                                          width: 25,
                                                          fit: BoxFit.cover,
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
                                  margin: EdgeInsets.only(top: 15),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Court 4 | court 5',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                

                                //////////////Hidden Section Start/////////////
                               open != false ? HiddenSection(): Container()
                                //////////////Hidden Section Start/////////////
                                
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
}

/////////////////////////

class HiddenSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    children: <Widget>[

                                      Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 110,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          PlayerExpandCard(),
                                          PlayerExpandCard(),
                                          PlayerExpandCard(),
                                          PlayerExpandCard(),
                                          PlayerExpandCard(),
                                          PlayerExpandCard(),
                                          PlayerExpandCard(),
                                          PlayerExpandCard(),

                                        ],
                                      ),
                                        )

                                    ],
                                  ),
                                );
  }
}



///////////////////////

class PlayerExpandCard extends StatefulWidget {
  @override
  _PlayerExpandCardState createState() => _PlayerExpandCardState();
}

class _PlayerExpandCardState extends State<PlayerExpandCard> {
  
  Color borderColor = Colors.white;
  double animHight = 100;
  double borderWidth = 0.5;
  bool boxOpen = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                                            onTap: (){
                                              setState(() {
                                               

                                              if(boxOpen == false) {
                                                    boxOpen = true;
                                                    animHight = 110;
                                                    borderWidth = 2.0;
                                                    borderColor = Colors.green[400] ;
                                                }else{
                                                  boxOpen = false;
                                                  animHight = 100;
                                                  borderWidth = 0.5;
                                                  borderColor = Colors.white;
                                                }
                                              });
                                            },
                                           child: Container( margin: EdgeInsets.only(left: 1),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                AnimatedContainer(
                                                  height: animHight,
                                                  width: 80, 
                                                  //color: borderColor, 
                                                  duration: Duration (milliseconds: 100),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(
                                                      color: borderColor,
                                                      width: borderWidth
                                                    )
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Container(
                                                      alignment: Alignment.center,
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          'assets/img/xx.jpg',
                                                          height: 50,
                                                          width: 50,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),

                                                      Container(
                                                        alignment: Alignment.center,
                                                        //color: Colors.red,
                                                        width: 70,
                                                        margin: EdgeInsets.only(top: 7, bottom: 5),
                                                        //color: Colors.red,
                                                        child: Text(
                                                          'Megan Fox',
                                                          //textDirection: TextDirection.ltr,
                                                          style: TextStyle(
                                                            color: Colors.white70,
                                                            fontSize: 15.0,
                                                            decoration: TextDecoration.none,
                                                            fontFamily: 'BebasNeue',
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),


                                    ////////////////Hidden Button/////////////////

                                                      boxOpen != false ?  
                                                      GestureDetector(
                                                        onTap: (){
                                                          print('object');
                                                        },
                                                        child: Container(
                                                        alignment: Alignment.center,
                                                        width: 70,
                                                        //color: Colors.red,
                                                        child: Text(
                                                          'Invite',
                                                          textDirection: TextDirection.ltr,
                                                          style: TextStyle(
                                                            color: Colors.green[400],
                                                            fontSize: 13.0,
                                                            decoration: TextDecoration.none,
                                                            fontFamily: 'BebasNeue',
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      ) : Container()

                                      ////////////////Hidden Button end/////////////////
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),),
                                          );
  }
}