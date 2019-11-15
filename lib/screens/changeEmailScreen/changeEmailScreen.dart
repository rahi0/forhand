import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/screens/passwordreset/enterPassword.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeEmail extends StatefulWidget {
  final userData;
  ChangeEmail(this.userData);
  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            FlutterI18n.translate(context, "Change Email"),
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 21.0,
              decoration: TextDecoration.none,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Container(
            //color: Colors.red,
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 40.0, top: 10.0, right: 40.0),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //// 2nd Step/////

                      Container(
                        child: Text(
                          FlutterI18n.translate(context, "Enter your new email to replace the old one"),
                          //'Enter your new email to replace the old one',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      EmailForm(widget.userData),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

//////// 2nd step///////

class EmailForm extends StatefulWidget {
  final userData;
  EmailForm(this.userData);
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  TextEditingController emailController;
  bool isSending = false;

@override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() {
    emailController = TextEditingController(
        text:'${widget.userData['email'] == null ? '' : widget.userData['email']}');
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: 100.0),
      width: MediaQuery.of(context).size.width,
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    FlutterI18n.translate(context, "Email"),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white54,
                      wordSpacing: 1,
                      letterSpacing: 0.5,
                      fontSize: 19.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textDirection: TextDirection.ltr,
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
                ),
              ],
            ),
          ),
          Container(
              // decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only( bottomRight: Radius.circular(8.0),
              //                 bottomLeft: Radius.circular(8.0)) ),
              width: MediaQuery.of(context).size.width,
              height: 45,
              margin: EdgeInsets.only(top: 50.0),
              child: RaisedButton(
                child: Text(
                  isSending ? FlutterI18n.translate(context, "Please wait") : FlutterI18n.translate(context, "Submit"),
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21.0,
                    decoration: TextDecoration.none,
                    fontFamily: 'BebasNeue',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.white,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                disabledColor: Colors.grey,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                onPressed: isSending ? null : _submitButton,
              ))
        ],
      ),
    );
  }

  showMsg(msg) {
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

  void _submitButton() async {
    if (emailController.text.isEmpty) {
      return showMsg(FlutterI18n.translate(context, "Email is empty"));
    }
    setState(() {
      isSending = true;
    });

    var res = await CallApi().postData({'email' : emailController.text}, 'change/email');
    var body = json.decode(res.body);
  
    if(body['success']){
      // update the password in shared preferences 
      widget.userData['email'] = emailController.text; 
      // re add the user data in shared perferences 
       SharedPreferences localStorage = await SharedPreferences.getInstance();
       localStorage.setString('user', json.encode(widget.userData));
      showMsg(body['msg']);

    }else{
      showMsg(body['msg']);
    }

    setState(() {
      isSending = false;
    });
  }
}
