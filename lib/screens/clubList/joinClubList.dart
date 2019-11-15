import 'package:flutter/material.dart';

class JoinClubList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Join Club',
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
          //centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: (){
                
              },
              icon: Icon(
                Icons.search, color: Colors.white, size: 30, ),
            )
          ],
          ),

          body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
          children: <Widget>[
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),
            ClubListCard(),

          ],
            ),
          ),
          )
      ),
    );
  }
}



class ClubListCard extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
      child: GestureDetector(
          onTap: () {
            //Navigator.of(context).pushNamed("/Login");
            print("working dude");
            // _modalBottomSheetMenu(context);
            //Navigator.of(context).pushNamed("/Standings");
          },
          child: Container(
            padding: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        //margin: EdgeInsets.only(bottom: 1.0),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/img/g4.png',
                            height: 55,
                            width: 55,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        //color: Colors.red,
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'Dim Khara Shomobay',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),


                /////////Join Button start/////////

                GestureDetector(
                  onTap: (){

                  },
                   child: Container(
                    width: 50,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.teal
                    ),
                    child: Text(
                              'Join',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  ),
                )

                /////////Join Button end/////////
              ],
            ),
          )),
    ));
  }
}