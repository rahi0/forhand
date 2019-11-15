import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intl/intl.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/screens/registrationScreen/imagePicker/image_picker_handler.dart';
import 'package:padelmatchv2/screens/routeSlideAnimation/animation.dart';
import 'package:padelmatchv2/screens/setting/settingScree.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends StatefulWidget {
  final userData;
  Registration(this.userData);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration>
    with TickerProviderStateMixin, ImagePickerListener {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController phoneController;
  TextEditingController emailController;
  TextEditingController passWordController;
  String _gender;

///////Image

  File _image;
  AnimationController _controller;
  ImagePickerHandler imagePicker;
  ImagePickerListener listener;

  @override
  void initState() {
    _getUserInfo();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    imagePicker = new ImagePickerHandler(this, _controller);
    imagePicker.init();
    super.initState();
  }

  // SOME INITIAL VALUES
  var _queradioValue1 = -1;
  var _currentClubSelected;
  bool _isLoading = false;
  void _getUserInfo() {
    print(widget.userData['racket']);
    firstNameController = TextEditingController(
        text:
            '${widget.userData['firstName'] == null ? '' : widget.userData['firstName']}');
    lastNameController = TextEditingController(
        text:
            '${widget.userData['lastName'] == null ? '' : widget.userData['lastName']}');
    phoneController = TextEditingController(
        text:
            '${widget.userData['phone'] == null ? '' : widget.userData['phone']}');
    _queradioValue1 = widget.userData['gender'] == 'Male' ? 0 : 1;
    _gender = widget.userData['gender'];
    _currentClubSelected = widget.userData['racket'].toUpperCase();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  //////

//////Dropdown
  var _clubName = [
    "ADIDAS",
    "ASICS",
    "BABOLAT",
    "SVART KRONN",
    "BULLPADEL",
    "DUNLOP",
    "HEAD",
    "JHAYBER",
    "PRINCE",
    "NOX",
    "ROYAL PADEL",
    "SIUX",
    "SLAZENGER",
    "STAR-VIE",
    "TECNIFIBRE",
    "VAIRO",
    "VARLION",
    "VIBOR-A",
    "VISION",
    "VÖLKL",
    "WILSON",
    "WINGPADEL",
    "OTHER",
    
  ];

  void _dropDownClubSelected(String newValueSelected) {
    setState(() {
      this._currentClubSelected = newValueSelected;
    });
  }

////////Radio

  void _queRadioValueChange1(int value) {
    print(value);
    setState(() {
      _queradioValue1 = value;

      switch (_queradioValue1) {
        case 0:
          _gender = 'Male';
          break;
        case 1:
          _gender = 'Female';
          break;
      }
    });
  }

///////DAte//////////
  DateTime selectedDate = DateTime.now();
  final f = new DateFormat('yyyy-MM-dd');

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1964, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void _showDialog(msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          backgroundColor: Colors.grey[800],
          content: new Text(
            msg,
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
              child: new Text(FlutterI18n.translate(context, "Close"),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // ScaffoldState scaffoldState;
  // _showMsg(msg) {
  //   final snackBar = SnackBar(
  //     content: Text(msg),
  //     action: SnackBarAction(
  //       label: 'Close',
  //       onPressed: () {
  //         // Some code to undo the change!
  //       },
  //     ),
  //   );
  //   Scaffold.of(context).showSnackBar(snackBar);
  //  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20.0, top: 0.0, right: 20.0),
            //color: Colors.green,
            //
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  //color: Colors.red,
                  alignment: Alignment.topLeft,
                  child: Text(
                    FlutterI18n.translate(context, "Edit Profile"),
                    // textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                //Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              ////////ImagePicker Start///////

                              Container(
                                margin: EdgeInsets.only(bottom: 1.0),
                                child: GestureDetector(
                                  onTap: () => imagePicker.showDialog(context),
                                  child: new Center(
                                    child: _image == null
                                        ? new ClipOval(
                                            child:
                                                widget.userData['profilePic'] !=
                                                        null
                                                    ? Image.network(
                                                        CallApi().baseUrl +
                                                            '${widget.userData['profilePic']}',
                                                        height: 80,
                                                        width: 80,
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.asset(
                                                        'assets/img/b.jpg',
                                                        height: 100,
                                                        width: 100,
                                                        fit: BoxFit.cover,
                                                      ),
                                          )
                                        : new Container(
                                            margin:
                                                EdgeInsets.only(bottom: 3.0),
                                            height: 80.0,
                                            width: 80.0,
                                            decoration: new BoxDecoration(
                                              color: const Color(0xff7c94b6),
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    _image.path),
                                                fit: BoxFit.cover,
                                              ),
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.0),
                                              borderRadius: new BorderRadius
                                                      .all(
                                                  const Radius.circular(80.0)),
                                            ),
                                          ),
                                  ),
                                ),
                              ),

                              ////////ImagePicker end/////////
                              // Container(
                              //   alignment: Alignment.topLeft,
                              //   margin: EdgeInsets.only(bottom: 1.0),
                              //   child:
                              // ),
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    FlutterI18n.translate(context, "ADD PHOTO"),
                                    //'ADD PHOTO',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      decoration: TextDecoration.none,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      //color: Colors.blue,
                      //width: 330,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              //left: 20,
                              top: 20,
                            ),
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //////////Name Field start///////
                                Container(
                                  margin: EdgeInsets.only(
                                    bottom: 10,
                                    left: 20,
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Container(
                                        width: 105,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              FlutterI18n.translate(context, "FIRST NAME"),
                                              //'FIRST NAME',
                                              // textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                color: Colors.white54,
                                                fontSize: 15.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextField(
                                              controller: firstNameController,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.normal,
                                              ),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText:  FlutterI18n.translate(context, "Type here"),
                                                  hintStyle: TextStyle(
                                                      color: Colors.white30)),
                                            ),
                                          ],
                                        ),
                                      )),
                                      Expanded(
                                          child: Container(
                                        width: 105,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              FlutterI18n.translate(context, "LAST NAME"),
                                              //'LAST NAME',
                                              //  textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                color: Colors.white54,
                                                fontSize: 15.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextField(
                                              controller: lastNameController,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'Lato',
                                                fontWeight: FontWeight.normal,
                                              ),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: FlutterI18n.translate(context, "Type here"),
                                                  hintStyle: TextStyle(
                                                      color: Colors.white30)),
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),

                                //////////Name Field End///////

                                //////////Phone Field start///////
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                    bottom: 10,
                                    left: 20,
                                  ),
                                  width: 210,
                                  // color: Colors.blue,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        FlutterI18n.translate(context, "MOBILE"),
                                        //'MOBILE',
                                        // textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white54,
                                          letterSpacing: 0.5,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'BebasNeue',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextField(
                                        controller: phoneController,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.normal,
                                        ),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: FlutterI18n.translate(context, "Enter phone number"),
                                            hintStyle: TextStyle(
                                                color: Colors.white30)),
                                      ),
                                    ],
                                  ),
                                ),

                                //////////Phone Field End///////

                                //////////Gender Selector RAdio start///////
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10),
                                  //width: 280,
                                  //color: Colors.red,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Radio(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              value: 0,
                                              groupValue: _queradioValue1,
                                              onChanged: _queRadioValueChange1,
                                              activeColor: Colors.white,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 3, left: 3),
                                              child: Text(
                                                'MALE',
                                                // textDirection: TextDirection.ltr,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.0,
                                                  //decoration: TextDecoration.none,
                                                  fontFamily: 'BebasNeue',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                //color: Colors.red,
                                                child: Radio(
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  value: 1,
                                                  groupValue: _queradioValue1,
                                                  onChanged:
                                                      _queRadioValueChange1,
                                                  activeColor: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.only(
                                                    top: 3, left: 3),
                                                child: Text(
                                                  'FEMALE',
                                                  //textDirection: TextDirection.ltr,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.0,
                                                    //decoration: TextDecoration.none,
                                                    fontFamily: 'BebasNeue',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                //////////Gender Selector RAdio End///////

                                //////////DOB Picker start///////
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 20,
                                    left: 20,
                                  ),
                                  //color: Colors.red,
                                  width: 210,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          FlutterI18n.translate(context, "YEAR OF BIRTH"),
                                          //'YEAR OF BIRTH',
                                          // textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontFamily: 'BebasNeue',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () => _selectDate(context),
                                          child: Container(
                                            //color: Colors.blue,
                                            padding: EdgeInsets.only(
                                                bottom: 10, right: 5, top: 5),
                                            child: Text(
                                              //'SELECT YEAR',
                                              f.format(selectedDate),
                                              //textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                //////////DOB Picker End///////

                                //////////Club DropDown start///////
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 30,
                                    bottom: 30,
                                    left: 20,
                                  ),
                                  width: 210,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        FlutterI18n.translate(context, "SELECT RACKETS"),
                                        //'SELECT RACKETS',
                                        // textDirection: TextDirection.ltr,
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 15.0,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'BebasNeue',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      ///////drop////////
                                      Container(
                                        width: 122,
                                        height: 30,
                                        // color: Colors.blue,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              FlutterI18n.translate(context, "SELECT YOUR Racket"),
                                              //'SELECT YOUR Racket',
                                              style: TextStyle(
                                                color: Colors.red[400],
                                                fontSize: 15.0,
                                                decoration: TextDecoration.none,
                                                fontFamily: 'BebasNeue',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            items: _clubName.map(
                                                (String dropDownStringItem) {
                                              return DropdownMenuItem<String>(
                                                  value: dropDownStringItem,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 0),
                                                    child: Text(
                                                      dropDownStringItem,
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontFamily: 'BebasNeue',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ));
                                            }).toList(),
                                            onChanged:
                                                (String newValueSelected) {
                                              _dropDownClubSelected(
                                                  newValueSelected);
                                            },
                                            value: _currentClubSelected,
                                          ),
                                        ),
                                      ),
                                      /////drop end////
                                    ],
                                  ),
                                ),

                                //////////Club DropDown End///////
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),

                //////////Register Button Section///////
                Container(
                  margin: EdgeInsets.only(top: 60.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          width: 300,
                          height: 50,
                          child: RaisedButton(
                            child: Text(
                              _isLoading ? FlutterI18n.translate(context, "SAVING") : FlutterI18n.translate(context, "SAVE"),
                              // textDirection: TextDirection.ltr,
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
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0)),
                            onPressed: _isLoading ? null : _registerButton,
                          ))
                    ],
                  ),
                ),

                //////////Register Button Section end///////
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  userImage(File _image) async {
    print('userimage is called');
    setState(() {
      this._image = _image;
    });
  }

  void _registerButton() async {
    setState(() {
      _isLoading = true;
    });

    print('selectedDate');
    print(selectedDate.toString());
    String base64Image = '';
    if (_image != null) {
      List<int> imageBytes = await _image.readAsBytes();
      print('base64 image');
      base64Image = base64Encode(imageBytes);
    }
    var data = {
      'firstName': firstNameController.text,
      'lastName': lastNameController.text,
      'phone': phoneController.text,
      'gender': _gender,
      'racket': _currentClubSelected,
      'dob': selectedDate.toString().split(' ')[0],
      'profilePic': base64Image
    };

    var res = await CallApi().postData(data, 'update-user');
    var body = json.decode(res.body);
    
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.setString('user', json.encode(body['user']));

     
      Navigator.pop(
          context, SlideLeftRoute(page: Settings()));
      _showDialog(body['message']);
    } else {
      print('user is not updated');
    }

    setState(() {
      _isLoading = false;
    });
  }

  // _registerUser(){

  //     var data = {
  //       'firstName' : firstNameController.text,
  //       'lastName' : lastNameController.text,
  //       'phone' : phoneController.text,
  //       'password' : passWordController.text,
  //       'email' : emailController.text,
  //       'gender' : _gender,
  //       'currentClubSelected' : _currentClubSelected,
  //       'selectedDate' : selectedDate,
  //       'image' : _image.path
  //    };
  // }

}
