import 'package:flutter/material.dart';
class MyTest extends StatelessWidget {
  final data; 
  MyTest(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('${data.team.teamName}', style: TextStyle(color: Colors.white),),
    );
  }
}