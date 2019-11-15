import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:padelmatchv2/animatedLoaders/americanoScreenLoader.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/model/americano/americanoModel.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/screens/widgets/americanoWidgets/bodyWidget.dart';

class AmericanoScreen extends StatefulWidget {
  final trId;
  final img;
  AmericanoScreen(this.trId, this.img);
  @override
  _AmericanoScreenState createState() => _AmericanoScreenState();
}

class _AmericanoScreenState extends State<AmericanoScreen> { 
  var top = 0.0;
  List matchesData = [];
  var ranks;
  bool _isLoading = true;
  var tr; 
  @override
  void initState() {
    _getData();
    super.initState();
  }
  Future _getData() async {
    var res = await CallApi().getData('get-americano-matches/${widget.trId}/Group A');
    final body = json.decode(res.body);
    
    var americanoPoints = AmericanoPoints.fromJson(body['points']); 
    store.dispatch(AmericanoRanks(americanoPoints.ranks));
    body['matches'].forEach((el) { 
        var sublist = el.map((val) => Matches.fromJson(val)).toList(); 
        matchesData.add(sublist); 
      });
    store.dispatch(AmricanoMatches(matchesData));
    var trInfo = Tr.fromJson(body['tr']);
    setState(() {
        ranks = americanoPoints.ranks;
        tr = trInfo;
        _isLoading = false;
    });

    
}

  @override
  Widget build(BuildContext context) {
    if(_isLoading){
      return Center(
        child: AmericanoScreenLoader(),
      );
    }
    return SafeArea(
      top: false,
      child: Scaffold(
          resizeToAvoidBottomPadding: false,
          backgroundColor: Colors.black,
          body: 
          
          
          NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.black,
                  expandedHeight: 260.0,
                  floating: false,
                  pinned: true,
                  snap: false,
                  flexibleSpace: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,

                      ///
                      centerTitle: true,
                      title: AnimatedOpacity(
                          duration: Duration(milliseconds: 300),
                          //opacity: top == 80.0 ? 1.0 : 0.0,
                          opacity: 1.0,
                          child: Text(
                            '${top <= 100.0 ? '${tr.tournamentName}' : ''}',
                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'BebasNeue',
                                              fontWeight: FontWeight.bold,
                                            ),
                          )),

                      ///
                      background: Container(
                        alignment: Alignment.center,
                        constraints: new BoxConstraints.expand(
                            height: 230.0,
                            width: MediaQuery.of(context).size.width),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: widget.img != null ? NetworkImage(
                          CallApi().baseUrl+'${widget.img}'
                      ) : AssetImage('assets/img/placeHolher.png'),
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(0.1),
                                BlendMode.darken),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 25, top: 85),
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                              height: 230.0,
                              width: 200,
                              //color: Colors.blue,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 120,
                                    // color: Colors.yellow,
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${tr.tournamentName}',
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
                                            '${tr.league.club.clubName}  |  ${tr.league.club.city}',
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
                                          height: 21,
                                          width: 60,
                                          margin: EdgeInsets.only(top: 5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.white),
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Text(
                                            '${tr.league.sportType}',
                                            textDirection: TextDirection.ltr,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              decoration: TextDecoration.none,
                                              fontFamily: 'BebasNeue',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  ///// removed-  will be assigned in future/////
                                  // Container(
                                  //   //color: Colors.white,
                                  //   alignment: Alignment.bottomLeft,
                                  //   child: Stack(
                                  //     children: _managerLists()
                                  //   ),
                                  // )
                                  ///// removed-  will be assigned in future/////
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(right: 20, top: 90),
                              padding: EdgeInsets.only(top: 30),
                              height: 255.0,
                              width: 90,
                              //color: Colors.red,
                              child: Image.network(
                                  CallApi().baseUrl+'${tr.league.club.logo}',
                                  height: 50,
                                  width: 50,
                                ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),

              ];
            },
            body: BodyWidget(matchesData, ranks, widget.trId),
          )
          ),
    );
  }

  List<Widget> _managerLists() {
    List<Widget> lists = [];
    var i = 0;
    var pos = 30.0;
    for (var m in tr.league.managers) {
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








