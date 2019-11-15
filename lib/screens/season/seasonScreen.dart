import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:padelmatchv2/animatedLoaders/seasoneLoader.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/model/season/seasonModel.dart';
import 'package:padelmatchv2/screens/widgets/seasonWidget/seasonLists.dart';

class Season extends StatefulWidget {
  final tr;
  Season(this.tr);
  @override
  _SeasonState createState() => _SeasonState();
}

class _SeasonState extends State<Season> {
  bool _isLoading = true;
  var seasons;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future _getData() async {
    var res = await CallApi().getData('get-season/${widget.tr.id}');
    final body = json.decode(res.body);
  
    var data = SeasonModel.fromJson(body);
    setState(() {
      seasons = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) { 
    if (_isLoading) {
      return Center(
        child: SeasoneLoader(), 
      );
    }
    return SafeArea(
      top: false,
      child: Container(
        child: Scaffold(
          // appBar: AppBar(backgroundColor: Colors.black,automaticallyImplyLeading: false),
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
              child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 40),
                  // constraints:
                  //     new BoxConstraints.expand(height: 255.0, width: 380),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  widget.tr.image.image != null ? NetworkImage(
                          CallApi().baseUrl+'${widget.tr.image.image}'
                      ) : AssetImage('assets/img/placeHolher.png'),
                      //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.darken),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 250.0,
                        width: 230,
                       // color: Colors.blue,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: BackButton(
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 30, top: 20),////top added//
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 125,
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${widget.tr.leagueName}',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'BebasNeue',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin:
                                              EdgeInsets.fromLTRB(0, 3, 0, 10),
                                          child: Text(
                                            '${widget.tr.club.clubName} | ${widget.tr.competitionType} | ${widget.tr.club.city}',
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
                                          alignment: Alignment.centerLeft,
                                          height: 21,
                                          width: 46,
                                          margin: EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: GestureDetector(
                                              onTap: () {
                                                //Navigator.of(context).pushNamed("/Editprofile");
                                              },
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 21,
                                                width: 46,
                                                margin: EdgeInsets.only(
                                                    left: 10, top: 2),
                                                child: Text(
                                                 '${widget.tr.sportType}',
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.0,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontFamily: 'BebasNeue',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  ///// removed-  will be assigned in future/////
                                  // Container(
                                  //   alignment: Alignment.centerLeft,
                                  //   margin: EdgeInsets.only(bottom: 10),
                                  //   //color: Colors.white,
                                  //   child: Stack(
                                  //     children: _managerLists(),
                                  //   ),
                                  // )
                                  ///// removed-  will be assigned in future/////
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(right: 20, top: 0),
                        padding: EdgeInsets.only(bottom: 20),
                        height: 70.0,
                        width: 90,
                        //color: Colors.red,
                        child: Image.network(
                              CallApi().baseUrl+'${widget.tr.club.logo}',
                              height: 50,
                              width: 50,
                            ),
                      )
                    ],
                  ),
                ),

                ///////////Box End//////////////
               
              //  _seasonCards()
              Column(
                children: _seasonCards()
              )


              ],
            ),
          )),

//////////////// BOTTOM APP BAR///////////////////
        ),
      ),
    );
  }

  List<Widget> _seasonCards(){
     List<Widget> cards = []; 
     for(var s in seasons.tr){
        cards.add(SeasonCard(s, widget.tr.image.image));
     }
    return cards;
  }
 
  List<Widget> _managerLists() {
    List<Widget> lists = [];
    var i = 0;
    var pos = 30.0;
    for (var m in widget.tr.managers) {
      if (i == 0) {
        lists.add(Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(bottom: 12.0),
          child: ClipOval(
            child: Image.network(
                CallApi().baseUrl + '${m.user.profilePic}',
                height: 32,
                width: 32,
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
              child: Image.network(
                      CallApi().baseUrl + '${m.user.profilePic}',
                      height: 32,
                      width: 32,
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






