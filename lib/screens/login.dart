import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/forms/loginForm.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.center,
          end: Alignment.topRight,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.4, 0.6, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.grey[900],
            Colors.brown[800],
            Colors.brown[600],
            Colors.grey[700],
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Container(
              //height: MediaQuery.of(context).size.height,
          //margin: EdgeInsets.only(left: 35.0, top: 0.0, right: 35.0),
          padding: EdgeInsets.only(left: 20, right: 20, top: 100),
           //color: Colors.red,
          //alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 70),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                      child: Text(
                         FlutterI18n.translate(context, "this is app name forhand"), 
                 //'Forehand',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                    ),

              Container(
               // color: Colors.blue,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 0.0, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    LoginForm()
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}


