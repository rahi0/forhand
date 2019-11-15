import 'package:flutter/material.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';

class HomeTopBar extends StatelessWidget {
  final userData;
  HomeTopBar(this.userData);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        expandedHeight: 170.0,
        //floating: false,
        pinned: false,

        flexibleSpace: new FlexibleSpaceBar(

            ////////////////////Collapsed Bar/////////////////
            background: Container(
          child: Stack(
            children: <Widget>[
              Container(
                constraints: new BoxConstraints.expand(
                  height: 215.0,
                ),
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage('assets/img/bcg1.jpg'),
                  //   colorFilter: new ColorFilter.mode(
                  //       Colors.black.withOpacity(0.0), BlendMode.darken),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //padding: EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 70, left: 10, right: 10),
                        //color: Colors.blue,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${store.state.demoState}',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.0,
                                decoration: TextDecoration.none,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Expanded(
                               child: Container(
                                //color: Colors.red,
                                child: Text(
                                  '${userData['firstName']} ${userData['lastName']}',
                                  
                                  overflow: TextOverflow.ellipsis,
                                  // 'asaeweawe',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28.0,
                                    decoration: TextDecoration.none,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 30,
                top: 15,
                   child: store.state.homePageData.clubs.length > 0 ? Container(
                  //padding: EdgeInsets.only(top: 30, right: 25),
                  //color: Colors.white,
                  alignment: Alignment.topCenter,
                  //margin: EdgeInsets.only(bottom: 1.0),
                  child: ClipRect(
                    child: 
                    Image.network(
                          CallApi().baseUrl+'${store.state.homePageData.clubs[0].club.logo}',
                          height: 85,
                          width: 85,
                        ),
                  ),
                ) : Container(),
              ),
            ],
          ),
        )

            ////////////////////Collapsed Bar  End/////////////////

            ),
      ),
    );
  }
}
