import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/screens/americanoResult/americanoAddEditResult.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';

class AmericanoRound extends StatelessWidget {
  final round; 
  final index; 
  AmericanoRound(this.round, this.index);

  @override
  Widget build(BuildContext context) {

    
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Text(
                  'Round $index ',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                round[0].groupName != 'Final' ? Text(
                  ' ${round[0].over==1 && round[1].over==1 ? 'COMPLETED' : 'UPCOMING'}',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: round[0].over==1 && round[1].over==1 ? Colors.cyan[300] : Colors.blue[800],
                    fontSize: 15.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ) : Container(),
              ],
            ),
          ),
          Container(
              child: Column(
            children: prepareCardWidgets()
          ))
        ],
      ),
    );
  }
  List<Widget> prepareCardWidgets() {
    List<Widget> widgets = [];
    
    round.forEach((item) {
      widgets.add(MatchesCard(item,index));
    });

    return widgets;
  }
}



class MatchesCard extends StatelessWidget {
  final item;
  final index;
  MatchesCard(this.item, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 0, top: 20),
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5, bottom: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(6.0),
            ),

            child: Column(
              children: <Widget>[


                //////////Teams/////////
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  //height: 110,
                  //color: Colors.teal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      /////////Team 1////////
                      Container(
                        //width: 140,
                        //color: Colors.red,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[

                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    child: Text(
                                      '${item.player1.firstName} ${item.player1.lastName}',
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.right,
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
                                    //alignment: Alignment.topLeft,
                                    child: ClipOval(
                                      child: item.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${item.player1.profilePic}',
                                                          height: 40,
                                                          width: 40,
                                                        )
                              :Image.asset(
                                        'assets/img/b.jpg',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    child: Text(
                                      '${item.player2.firstName} ${item.player2.lastName}',
                                      textDirection: TextDirection.ltr,
                                      textAlign: TextAlign.right,
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
                                    //alignment: Alignment.topLeft,
                                    child: ClipOval(
                                      child: item.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${item.player2.profilePic}',
                                                          height: 40,
                                                          width: 40,
                                                        )
                              :Image.asset(
                                        'assets/img/b.jpg',
                                        height: 40,
                                        width: 40,
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
                      /////////Team 1 end////////
                      

                      /////////VS////////
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 3, right: 3),
                        height: 22,
                        width: 22,
                        child: Text(
                          'v/s',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 11.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      /////////VS end////////
                      

                      /////////Team 2////////
                      Container(
                        //color: Colors.red,
                        //width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: <Widget>[



                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    //alignment: Alignment.topLeft,
                                    child: ClipOval(
                                      child: item.player3.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${item.player3.profilePic}',
                                                          height: 40,
                                                          width: 40,
                                                        )
                              :Image.asset(
                                        'assets/img/b.jpg',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 100,
                                    child: Text(
                                      '${item.player3.firstName} ${item.player3.lastName}',
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
                              child: Row(
                                children: <Widget>[



                                  Container(
                                    margin: EdgeInsets.only(right: 5),
                                    //alignment: Alignment.topLeft,
                                    child: ClipOval(
                                      child: item.player4.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${item.player4.profilePic}',
                                                          height: 40,
                                                          width: 40,
                                                        )
                              :Image.asset(
                                        'assets/img/b.jpg',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                                  Container(
                                    width: 100,
                                    child: Text(
                                      '${item.player4.firstName} ${item.player4.lastName}',
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
                          ],
                        ),
                      ),
                      /////////Team 2 end////////
                      

                    ],
                  ),
                ),
                //////////Teams ends/////////


                //////////Points/////////
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width: 30,),
                      Container(
                        //color: Colors.yellow,
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              //color: Colors.red,
                              alignment: Alignment.center,
                              height: 32,
                              width: 40,
                              child: Text(
                                '${item.teamOnePoints == null ? 0 : item.teamOnePoints}',
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
                              //child: Tab(icon: Icon(Icons.remove),),
                              height: 2.0,
                              width: 8,
                              color: Colors.white,
                            ),

                            Container(
                              //color: Colors.blue,
                              alignment: Alignment.center,
                              height: 32,
                              width: 40,
                              child: Text(
                                '${item.teamTwoPoints == null ? 0 : item.teamTwoPoints}',
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

                      SizedBox(width: 30,),
                    ],
                  ),
                ),
                //////////Points ends/////////
                  
                //////////Court/////////
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  //color: Colors.red,
                    child: Text(
                      '${item.court == null ? '' : item.court.courtName.toUpperCase()}',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 13.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Lato',
                        
                        fontWeight: FontWeight.normal,
                      ),
                    )),

                //////////Court end/////////
                



                //////////Enter result /////////
                GestureDetector(
            onTap: () {
              Navigator.push(context, SlideLeftRoute(page: AmericanoEnterResult(item, index)) );
            },
            child: item.canEdit ? Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                //color: Colors.blue,
                  border: BorderDirectional(
                      top: BorderSide(color: Colors.red[400], width: 0.5))),
              child: Text(
                FlutterI18n.translate(context, "Enter Result"),
                //'Enter Result',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 17.0,
                  decoration: TextDecoration.none,
                  fontFamily: 'BebasNeue',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ): Container(),
          )
                
                //////////Enter result end/////////
              ],
            ),
          ),
        ],
      ),
    );
  }
}







class MatchesCard2 extends StatelessWidget {
  final item;
  MatchesCard2(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5, bottom: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10, left: 3, right: 1),
                  child: Row(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        child: Column(
                          children: <Widget>[
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
                                        'assets/img/aa.jpg',
                                        height: 40,
                                        width: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10, bottom: 4),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Jhon Snow',
                                      //'${item.player1.firstName} ${item.player1.lastName}',
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
                        //  color: Colors.blue,
                        child: Column(
                          children: <Widget>[
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
                  //width: 500,
                  //color: Colors.red,
                  margin: EdgeInsets.fromLTRB(110.0, 20, 0, 0),
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        //color: Colors.red,
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
                        //child: Tab(icon: Icon(Icons.remove),),
                        height: 2.0,
                        width: 8,
                        color: Colors.white,
                      ),
                      Container(
                        //color: Colors.red,
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


