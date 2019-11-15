import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/screens/passwordreset/passwordResetScreen.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  
  bool _isLoading = false;
  bool checkBoxValue = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  ScaffoldState scaffoldState;
   
  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: FlutterI18n.translate(context, "Close"),
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 0.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  FlutterI18n.translate(context, "Email"), 
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 19.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextField(
                  textDirection: TextDirection.ltr,
                  controller: emailController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: FlutterI18n.translate(context, "Enter email"), 
                      hintStyle: TextStyle(color: Colors.white30)),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  FlutterI18n.translate(context, "Password"),
                  //'Password',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 19.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextField(
                  textDirection: TextDirection.ltr,
                  controller: passwordController,
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.normal,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: FlutterI18n.translate(context, "Enter password"),
                      hintStyle: TextStyle(color: Colors.white30)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            //color: Colors.red,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // color: Colors.red,
                  child: new Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: checkBoxValue,
                      activeColor: Colors.blue,
                      onChanged: (bool newValue) {
                        setState(() {
                          checkBoxValue = newValue;
                        });
                      }),
                ),
                Expanded(
                  child: Container(
                      //color: Colors.blue,
                      //padding: EdgeInsets.only(left: 10, top: 10),
                      child: Wrap(
                    children: <Widget>[
                      Text(
                        'Jag har läst och godkänner Forehands ',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            _launchURL();
                          },
                          child: Text(
                            'integritetspolicy ',
                            style: TextStyle(color: Colors.grey),
                          )),
                      Text(
                        'och ',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            _launchURL();
                          },
                          child: Text(
                            'användarvillkor',
                            style: TextStyle(color: Colors.grey),
                          )),
                    ],
                  )),
                )
              ],
            ),
          ),
          Container(
              // decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only( bottomRight: Radius.circular(8.0),
              //                 bottomLeft: Radius.circular(8.0)) ),
              width: MediaQuery.of(context).size.width,
              height: 48,
              margin: EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                child: Text(
                  _isLoading ? FlutterI18n.translate(context, "Loging in") : FlutterI18n.translate(context, "Login"),
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    //color: Colors.white,
                    fontSize: 21.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.white,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                onPressed: _isLoading ? null : _handleLogin,
              )),

          GestureDetector(
              onTap: () {
                Navigator.push(
                    context, SlideLeftRoute(page: ResetPasswordEmail()));
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 15.0),
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  FlutterI18n.translate(context, "FORGOT PASSWORD"),
                  //'FORGOT PASSWORD',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.red[400],
                    fontSize: 19.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  void _handleLogin() async {
    if (emailController.text.isEmpty) {
      return _showMsg(FlutterI18n.translate(context, "Email is empty"));
    }
    else if (passwordController.text.isEmpty) {
      return _showMsg(FlutterI18n.translate(context, "Password is empty"));
    }
    else if (!checkBoxValue) {
      return _showMsg(FlutterI18n.translate(context, "Please accept the privacy policy"));
    }
    setState(() {
      _isLoading = true;
    });
    // give all logic to check if input has desired values or not...
    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };

    var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body);
    if (!body['success']) {
      // show error msg
      _showMsg(body['message']);
    } else {
      // user is logged in so save the user information in local storage
      var token = body['token'];
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', token);
      localStorage.setString('user', json.encode(body['user']));
      //Navigator.pushNamed(context, "/");
      Navigator.push(context, SlideLeftRoute(page: HomePage()));
    }
    setState(() {
      _isLoading = false;
    });
  }

  _launchURL() async {
    const url = "https://forehand.se/policy.html";
    if (await canLaunch(url)) {
      print('url is $url');
      if(url != null){
        await launch(Uri.encodeFull(url), forceWebView: true); //forceWebView
      } 
    } else {
      throw 'Could not launch $url';
    }
  }
}
