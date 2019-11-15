import 'package:flutter/material.dart';

class ShowDialogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
              backgroundColor: Colors.grey[800],
              content: new Text('msg',
              style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.normal,
                    ),
              ),
              //content: new Text("Alert Dialog body"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
  }
}




