import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/model/team/teamList.dart';
import 'package:padelmatchv2/screens/editTeam/editTeamScreen.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';

class MyTeams extends StatefulWidget {
  @override
  _MyTeamsState createState() => _MyTeamsState();
}

class _MyTeamsState extends State<MyTeams> {
  @override
  bool _isLoading = true;
  var teamLists;
  @override
  void initState() {
   _getTeamList();
    super.initState();
  }
  

  void _getTeamList() async{
    
     var res = await CallApi().getData('get-my-team');
     var body = json.decode(res.body);
     var teams = TeamList.fromJson(body);
     setState(() {
        _isLoading = false; 
        teamLists = teams.teams;
     });
  }


  @override
 Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
             FlutterI18n.translate(context, "My Teams"),
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
          centerTitle: true,),

          body: Container(
            child: _isLoading ? Center(
              child: CircularProgressIndicator(),
            ) 
            :SingleChildScrollView(
            child: 
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 65),
              child: Column(
                children: _teamListCards()
              ),
            ),
          ),
          )
      ),
    );
  }

  List<Widget> _teamListCards(){
      List<Widget> cards = [];
      for(var d in teamLists){
        cards.add(TeamListCard(d)); 
      }
      return cards;

  }



}










class TeamListCard extends StatelessWidget {
  final team;
  TeamListCard(this.team);


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: GestureDetector(
          onTap: () {
            Navigator.push(context, SlideLeftRoute(page: EditTeamScreen(team)));
          },
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(6.0)),
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 0),
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      width: 95,
                      alignment: Alignment.center,
                      //color: Colors.yellow,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            //margin: EdgeInsets.only(bottom: 1.0),
                            child: ClipOval(
                              child: team.player1.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${team.player1.profilePic}',
                                                          height: 50,
                                                          width: 50,
                                                        )
                              :Image.asset(
                                'assets/img/b.jpg',
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 45,
                            child: Container(
                              alignment: Alignment.topLeft,
                              //margin: EdgeInsets.only(bottom: 1.0),
                              child: ClipOval(
                                child: team.player2.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${team.player2.profilePic}',
                                                          height: 50,
                                                          width: 50,
                                                        )
                              :Image.asset(
                                  'assets/img/b.jpg',
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      width: 130,
                      //color: Colors.white54,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        '${team.teamName}',
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

              Container(
                //height: 30,
                width: 40,
                //color: Colors.red,
                  margin: EdgeInsets.only(left: 20, top: 0),
                  alignment: Alignment.center,
                  child: Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.white,
                            size: 30,
                            ),
                  ),
            ]),
          )),
    ));
  }
}