import 'package:flutter/material.dart';
import 'package:padelmatchv2/api/api.dart';

class UserList extends StatelessWidget { 
  final title;
  final users; 
  UserList(this.users, this.title);
  @override
  Widget build(BuildContext context) {
    
    List<Widget> userCards = [];
    for(var u in users){
       print(u.firstName);
        userCards.add(
           UserCard(u),
        );
    }


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            '$title',
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

          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: userCards
              ),
            ),
          ),
      ),
    );
  }
}







class UserCard extends StatelessWidget {
  final user;
  UserCard(this.user);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      margin: EdgeInsets.only(left: 10, right: 10),
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
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.only(bottom: 1.0),
                  child: ClipOval(
                    child: user.profilePic != null ? Image.network(
                                                          CallApi().baseUrl+'${user.profilePic}',
                                                          height: 55,
                                                          width: 55,
                                                        )
                     :Image.asset(
                      'assets/img/b.jpg',
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
                    '${user.firstName} ${user.lastName}',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )),
    ));
  }
}