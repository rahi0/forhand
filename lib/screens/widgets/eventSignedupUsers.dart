import 'package:flutter/material.dart';
import 'package:padelmatchv2/api/api.dart';

class EventSignedUpUsers extends StatelessWidget {
  final users;
  EventSignedUpUsers(this.users);
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white70,
      width: 90,
      alignment: Alignment.centerLeft,
      child: Stack(children: userLists()),
    );
  }

  List<Widget> userLists() {
    List<Widget> lists = [];

    var i = 0;
    var pos = 27.0;
    for (var m in users) {
      if (i == 0) {
        lists.add(
          Container(
            alignment: Alignment.topLeft,
            // margin: EdgeInsets.only(bottom: 12.0),
            child: ClipOval(
              child: m.user.profilePic != null
                  ? Image.network(
                      CallApi().baseUrl + '${m.user.profilePic}',
                      height: 32,
                      width: 32,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/img/b.jpg',
                      height: 32,
                      width: 32,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        );
      } else {
        print('i am in else');
        pos = i * pos;
        print(pos);
        lists.add(
          Positioned(
            left: pos,
            child: Container(
              alignment: Alignment.topLeft,
              // margin: EdgeInsets.only(bottom: 1.0),
              child: ClipOval(
                child: m.user.profilePic != null
                    ? Image.network(
                        CallApi().baseUrl + '${m.user.profilePic}',
                        height: 32,
                        width: 32,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/img/b.jpg',
                        height: 32,
                        width: 32,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        );
      }
      i++;
    }
    return lists;
  }
}
