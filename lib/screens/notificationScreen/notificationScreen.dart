import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/customWidget/readMore.dart';
import 'package:padelmatchv2/model/noti/notiModel.dart';
import 'package:padelmatchv2/screens/noInternet.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();

}

class _NotificationPageState extends State<NotificationPage> {
  bool isLoading = true;
  bool internet = true;
  var notiData;
  @override
  void initState() {
    //_getNotifications();
    internetCheck();
    super.initState();
  }



  void internetCheck() async {
    
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        internet = true;
      });
      _getNotifications();
      return null;
    }
    
    setState(() {
      internet = false;
      isLoading = false;
    });
  
  }

  void _getNotifications() async {
     var res = await CallApi().getData('app/user-noti');
     var body = json.decode(res.body);
    
     var noti  = NotiModel.fromJson(body);
     
     setState(() {
        notiData = noti.noti;
       isLoading = false;
     });

    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
            FlutterI18n.translate(context, "Notifications"),
            //'Notifications',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 21.0,
              decoration: TextDecoration.none,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          automaticallyImplyLeading: false),
      body:  internet ? SafeArea(
        top: false,
        child:  isLoading ? Container(
          child: Center(child: CircularProgressIndicator(),),
        ) : Container(
          padding: EdgeInsets.only(top: 20, right: 10, left: 10),
          child: CustomScrollView(
            slivers: <Widget>[
              ////////fake Cards start//////////

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return NotificationCard(notiData[index]);
                  },
                  childCount: notiData.length,
                ),
              ),
              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (BuildContext context, int index) {
              //        return PracticeCard();
              //     },

              //     childCount: 1,
              //   ),
              // ),

              ////////fake Cards End//////////
            ],
          ),
        ),
      ) : NoInternet()
    );
  }
}

// RaisedButton(
//               onPressed: (){
//                 Navigator.push( context, SlideLeftRoute(page: ShopItemsPage()));
//               },
//               child: Text('Items'),
//             ),

class NotificationCard extends StatefulWidget {
  final noti;
  NotificationCard(this.noti);
  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool open = false; 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
            if(open == false) {
                 open = true;
            }else{
               open = false;
            }
            
         });
      },
      child: Card(
        elevation: 2,
        color: Colors.grey[900],
        margin: EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.only(right: 15, left: 15, top: 10, bottom: 10),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          //color: Colors.blue,
          child: Column(
            children: <Widget>[
              Container(
                //color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      //color: Colors.red,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10.0),
                      child: ClipOval(
                        child: Image.network(
                            CallApi().baseUrl+'${widget.noti.image}',
                            height: 50,
                            width: 50,
                          ),
                        
                       
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Container(
                            //  // margin: EdgeInsets.only(bottom: 2),
                            //   alignment: Alignment.centerRight,
                            //   child: Text(
                            //     '35m ago',
                            //     textDirection: TextDirection.ltr,
                            //     style: TextStyle(
                            //                         color: Colors.blue,
                            //                         fontFamily:"sourcesanspro",
                            //                         fontSize: 12,
                            //                         fontWeight: FontWeight.normal
                            //                             ),
                            //   ),
                            // ),

                            Container(
                              child: Text(
                                '${widget.noti.title}',
                                //textDirection: TextDirection.ltr,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "sourcesanspro",
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),


                            // Container(
                            //   padding: EdgeInsets.only(top: 3, bottom: 3),
                            //   child: ReadMoreText(
                            //     '${widget.noti.msg}',
                            //          style: TextStyle(
                            //         color: Colors.white,
                            //         fontFamily: "sourcesanspro",
                            //         fontSize: 13,
                            //         fontWeight: FontWeight.normal),
                            //     trimLines: 2,
                            //     colorClickableText: Colors.blue[300],
                            //     trimMode: open != false ? TrimMode.Length : TrimMode.Line,
                            //     trimCollapsedText: '...See more',
                            //     trimExpandedText: ' show less',
                            //   ),
                            // ),

                            Container(
                              child: Text(
                                 '${widget.noti.msg}',
                                //textDirection: TextDirection.ltr,
                                overflow: open != false ? null : TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "sourcesanspro",
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 4),
                              //alignment: Alignment.centerRight,
                              child: Text(
                                '${widget.noti.time}',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: "sourcesanspro",
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
