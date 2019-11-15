import 'package:flutter/material.dart';
import 'package:padelmatchv2/screens/home.dart';
import 'package:padelmatchv2/screens/setting/settingScree.dart';
import 'package:padelmatchv2/screens/tournamentScreens/tournament.dart';

class WidgetListPage extends StatefulWidget {
  WidgetListPage({this.color, this.title});
  final MaterialColor color;
  final String title;

  @override
  _WidgetListPageState createState() => _WidgetListPageState();
}

class _WidgetListPageState extends State<WidgetListPage> {
  var bottomItemIndex;


  final List bottomItemList = [Home(), Tournament(), Settings()];
  @override
  Widget build(BuildContext context) {
    if (widget.title == "Home") {
      bottomItemIndex = bottomItemList[0];
    } else if (widget.title == "Tournament") {
      bottomItemIndex = bottomItemList[1];
    } else if (widget.title == "Settings") {
      bottomItemIndex = bottomItemList[2];
    }
    return Scaffold(
        body: Container(
     // color: Colors.white,
      child: bottomItemIndex,
    ));
  }
}
