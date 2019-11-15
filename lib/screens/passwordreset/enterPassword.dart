import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/screens/login.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';

class ResetPasswordPass extends StatefulWidget {
  final code; 
  ResetPasswordPass(this.code);
  @override
  _ResetPasswordPassState createState() => _ResetPasswordPassState();
}

class _ResetPasswordPassState extends State<ResetPasswordPass> {

   



  @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            //'Change Password',
            FlutterI18n.translate(context, "Change Password"),
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
                      
                      //// 3rd Step/////

                      Container(
                        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Text(
                          FlutterI18n.translate(context, "Reset your password and login"),
                          //'Reset your password and login',
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

                      // store.state.isEmail ?  EmailForm() : Container(),
                      // PinForm(),
                      ResetPasswordForm(widget.code),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}






////// 3rd step//////

class ResetPasswordForm extends StatefulWidget {
  final code;
  ResetPasswordForm(this.code);
  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  bool isSending = false;
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    FlutterI18n.translate(context, "New Password"),
                  //  'New Password',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      letterSpacing: 0.5,
                      color: Colors.white54,
                      fontSize: 19.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    textDirection: TextDirection.ltr,
                    controller: oldPasswordController,
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
                        hintText: FlutterI18n.translate(context, "Enter New Password"),
                        hintStyle: TextStyle(color: Colors.white30)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    FlutterI18n.translate(context, "Confirm Password"),
                   // 'Confirm Password',
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
                    controller: newPasswordController,
                    obscureText: true,
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
                        hintText: FlutterI18n.translate(context, "Confirm New Password"),
                        hintStyle: TextStyle(color: Colors.white30)),
                  ),
                ),
              ],
            ),
          ),
          Container(
              // decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only( bottomRight: Radius.circular(8.0),
              //                 bottomLeft: Radius.circular(8.0)) ),
              width:  MediaQuery.of(context).size.width,
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
                onPressed: isSending ? null :  _submit,
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

  void _submit() async {
    if (oldPasswordController.text.isEmpty) {
      return showMsg(FlutterI18n.translate(context, "Password is empty"));
    } else if (newPasswordController.text != oldPasswordController.text) {
      return showMsg(FlutterI18n.translate(context, "Password didn't match"));
    }

    setState(() {
       isSending = true;
    });
    var data = {
        'code' : widget.code, 
        'password' : oldPasswordController.text
    };


    var res = await CallApi().postData(data, 'change/password');
    var body = json.decode(res.body);
    
    if(body['success']){
        showMsg(body['msg']);
        Navigator.push(context, SlideLeftRoute(page: Login()));
    }else{
      showMsg(FlutterI18n.translate(context, "Something went wrong"));
    }
     setState(() {
       isSending = false;
    });




  }
  
}
