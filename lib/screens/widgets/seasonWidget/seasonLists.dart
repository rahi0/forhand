import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/screens/americano/americanoScreen.dart';
import 'package:padelmatchv2/screens/divranks/DivRankHomePage.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';

class SeasonCard extends StatelessWidget {
  final tr;
  final img;
  SeasonCard(this.tr, this.img);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(tr.tournamentType=='Divisions'){
           //Navigator.pushNamed(context, "/divrank/0/${tr.id}");
          Navigator.push(context, SlideLeftRoute(page: DivRankHomePage("${0}", "${tr.id}")));

        }else{
          //Navigator.of(context).pushNamed("/americano/${tr.id}");
          Navigator.push(context, SlideLeftRoute(page: AmericanoScreen("${tr.id}", img)));
        }
        
      },
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                //color: Colors.red,
                  border: Border(
                      bottom: BorderSide(color: Colors.white54, width: 1))),
              height: 80,
              width: MediaQuery.of(context).size.width,
              //margin: EdgeInsets.only(top: 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    //width: 150,
                    //color: Colors.blue,
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        
                        Container(
                          child: Text(
                            '${tr.tournamentName}',
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
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
                            children: <Widget>[
                              Text(
                                FlutterI18n.translate(context, "Start date"),
                                //'Start date ',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                ' ${tr.started}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 80,
                    //width: 100,
                    //color: Colors.green,
                    margin: EdgeInsets.only(
                      top: 24,
                    ),

                    child: Row(
                      children: <Widget>[
                        Text(
                          FlutterI18n.translate(context, "End date"),
                          //'End date ',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          ' ${tr.ended} ',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
