import 'package:flutter/material.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/season/seasonScreen.dart';
import 'package:padelmatchv2/screens/widgets/eventSignedupUsers.dart';

class RunningCard extends StatelessWidget {
  final tr;
  RunningCard(this.tr);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).pushNamed("/season/${tr.id}");
        Navigator.push(context, SlideLeftRoute(page: Season(tr)));
        //Navigator.push(context, SlideLeftRoute(page: Season("${tr.id}", tr.image.image)));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 5, right: 10, left: 10),
          alignment: Alignment.center,
          constraints: new BoxConstraints.expand(
            height: 225.0,
          ),
          //color: Colors.yellow,
          child: Stack(
            children: <Widget>[
              Container(
                constraints: new BoxConstraints.expand(
                  height: 225.0,
                ),
                child: FadeInImage(
                  image: NetworkImage(
                      CallApi().baseUrl+'${tr.image.image}'),
                  placeholder: AssetImage('assets/img/placeHolher.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 50),
                    //height: 200.0,
                    width: 190,
                    //color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          //color: Colors.red,
                          //height: 100,
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${tr.leagueName}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'BebasNeue',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                //color: Colors.red,
                                margin: EdgeInsets.fromLTRB(0, 3, 0, 5),
                                child: Text(
                                  '${tr.club.clubName} | ${tr.competitionType} | ${tr.club.city}',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 23,
                                width: 60,
                                padding: EdgeInsets.only(top: 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(3)),
                                child: Text(
                                  '${tr.sportType}',
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
                        // Container(
                        //   margin: EdgeInsets.only(top: 10),
                        //   alignment: Alignment.bottomLeft,
                        //   child: Stack(
                        //     children: _managerLists(),
                        //   ),
                        // )

                        ///// removed-  will be assigned in future/////
                        //EventSignedUpUsers(tr.managers)  
                        ///// removed-  will be assigned in future/////
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(right: 30, top: 50),
                    height: 255.0,
                    width: 60,
                    //color: Colors.red,
                    child: Image.network(
                        CallApi().baseUrl+'${tr.club.logo}',
                        height: 50,
                        width: 50,
                      ),
                  )
                ],
              ),
            ],
          )),
    );
  }

  List<Widget> _managerLists() {
    List<Widget> lists = [];
    var i = 0;
    var pos = 30.0;
    for (var m in tr.managers) {
      if (i == 0) {
        lists.add(Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(bottom: 12.0),
          child: ClipOval(
            child: Image.asset(
              'assets/img/c.jpg',
              height: 35,
              width: 35,
              fit: BoxFit.cover,
            ),
          ),
        ));
      } else {
        pos = i * pos;
        lists.add(Positioned(
          left: pos,
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom: 1.0),
            child: ClipOval(
              child: Image.asset(
                'assets/img/bb.jpg',
                height: 35,
                width: 35,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
      }
      i++;
    }
    return lists;
  }
}
