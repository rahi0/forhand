import 'package:flutter/material.dart';
import 'package:padelmatchv2/screens/widgets/tournamentCardsWdiget/running_cards.dart';


class PlayMates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          //margin: EdgeInsets.only(left: 60.0, top: 70.0, right: 60.0),

          child: Column(
            children: <Widget>[
              PlayMatesCard(),
              PlayMatesCard(),
              PlayMatesCard(),
            ],
          ),
        ),
      ),
    );
  }
} 




class PlayMatesCard extends StatefulWidget {
  @override
  _PlayMatesCardState createState() => _PlayMatesCardState();
}

class _PlayMatesCardState extends State<PlayMatesCard> {
  bool open = false;
  Radius rd = Radius.circular(6.0); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                //Navigator.pushNamed(context, "/divrank/${match[index].div.id}/${match[index].trId}");
                 //Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${match[index].div.id}", "${match[index].trId}")));
                 setState(() {
            if(open == false) {
                 open = true;
                 rd = Radius.circular(0.0);
            }else{
               open = false;
               rd = Radius.circular(6.0);
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
                                    topRight: Radius.circular(6.0),
                                    bottomLeft: rd,
                                    bottomRight: rd
                                    )),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        //color: Colors.red,
                                        alignment: Alignment.centerLeft,
                                        padding:
                                            EdgeInsets.fromLTRB(15.0, 15.0, 1.0, 0.0),
                                        child: Text(
                                          'PlayMAte Invitation',
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
                                        padding:
                                            EdgeInsets.fromLTRB(15.0, 0.0, 1.0, 12.0),
                                        child: Text(
                                          'Micael Dammert',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 17.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      )
                                    ],
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
                                          'Fri | 25 July | 19:00',
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

                          //////////////Hidden Section end/////////////
                        

                         open != false ? Container(
                            //color: Colors.red,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          right: 2.0),
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
                                                      alignment: Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          right: 2.0),
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
                                                      alignment: Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          right: 2.0),
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          'assets/img/c.jpg',
                                                          height: 50,
                                                          width: 50,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.topLeft,
                                                      margin: EdgeInsets.only(
                                                          right: 0.0),
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          'assets/img/sadek-plus.png',
                                                          height: 50,
                                                          width: 50,
                                                          color: Colors.green,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'PadelCenter | Gotborg | court 4',
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
                                

                                
                                
                                
                              ],
                            ),
                          ) : Container()

                          //////////////Hidden Section end/////////////
                        ],
                      ),
                    ),
    );
  }
}