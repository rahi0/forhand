import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:country_icons/country_icons.dart';
class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  Locale currentLang;
  var languageOptions = [
    {'flag': 'assets/img/en.png', 'name': 'English', 'selected': false, 'id': 1, 'code': 'en'},
    {
      'flag': 'assets/img/sw.png',
      'name': 'Swedish',
      'selected': false,
      'id': 2, 
      'code': 'sw'
    },
    // {'flag': 'assets/img/g3.png','name': 'Italian', 'selected': false, 'id': 3},
  ];

  @override
  void initState() {
    // get the current 
    super.initState();
    new Future.delayed(Duration.zero, () async {
      setState(() {
        currentLang = FlutterI18n.currentLocale(context);
      });
    });
    
    changeSelectedLang();
    
  }

  void changeSelectedLang() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var localCode =  localStorage.getString('localCode');
    for (var d in languageOptions) {
      if (localCode == d['code']) {
        d['selected'] = true;
       } 
    }
  }

  

  changeLanguage(String name) {
    var locale = 'en';
    if (name == "Swedish") {
      locale = 'sw';
    }
    setState(() {
      currentLang = new Locale(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            FlutterI18n.translate(context, "Change Language"),
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.0,
              decoration: TextDecoration.none,
              fontFamily: 'BebasNeue',
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            child: Column(
              children: _showLanguageOptions(),
            ),
          ),
        ));
  }

// onTap: () async {
//                    print("object");
//                     changeLanguage();
//                     await FlutterI18n.refresh(context, currentLang);
//                   },

  List<Widget> _showLanguageOptions() {
    List<Widget> items = [];
    var index = 0;
    for (var d in languageOptions) {
      items.add(
        GestureDetector(
          onTap: () async {
            _changeLanguageOptions(d['id']);
            print(d['id']);
            changeLanguage(d['name']);
            await FlutterI18n.refresh(context, currentLang);
          },
          child: Container(
            padding: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        //margin: EdgeInsets.only(bottom: 1.0),
                        child: ClipOval(
                         
                          child: Image.asset(
                            "${d['flag']}",
                            height: 45,
                            width: 45,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        //color: Colors.red,
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          "${d['name']}",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            decoration: TextDecoration.none,
                            fontFamily: 'BebasNeue',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                /////////Join Button start/////////

                Container(
                    child: d['selected']
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Container())

                /////////Join Button end/////////
              ],
            ),
          ),
        ),
      );
      index++;
    }

    return items;
  }

  void _changeLanguageOptions(id) async{
    var code;
    for (var d in languageOptions) {
      if (id == d['id']) {
        d['selected'] = true;
        code = d['code'];
      } else {
        d['selected'] = false;
      }
    }
    // save the language in shared prefrences 
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('localCode', code);
    
    setState(() {
      languageOptions = languageOptions;
    });
  }
}
