
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:padelmatchv2/animatedLoaders/matchloader.dart';
import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/main.dart';
import 'package:padelmatchv2/model/DivisionFixutureAndRank/divData.dart';
import 'package:padelmatchv2/redux/action.dart';
import 'package:padelmatchv2/screens/widgets/divrankswidget/switch.dart';


enum WidgetMarker { matches, standings}
class DivRankHomePage extends StatefulWidget {
  bool isComingFromStanding;
  final String divId;
  final String trId;
  DivRankHomePage(this.divId, this.trId, {this.isComingFromStanding = false});

  @override
  _DivRankHomePageState createState() => _DivRankHomePageState();
}

class _DivRankHomePageState extends State<DivRankHomePage> {
  var name = 'ssss';
  bool _isDataLoaded = false;
  var divData;
  var divisionNames; 
  var divisionRanks;
  var myRanks;
  List divisionData = [];
  List myMatches = [];
  var seasonName = '';
  var index = 0;
  var myDiv;
  bool _isShowMyMatchesOnly = false;
  bool hasData = false;
  var msg = '';

  @override
  void initState() {
    print('main page init is called');
    super.initState();
    _getData();
  }

 void  _getData() async {
   
   var res = await CallApi().getData('tournament-with-div-and-matches/${widget.trId}/${widget.divId}');
   final body = json.decode(res.body);
   print(body.toString());
    if(!body['success']){
       setState(() {
         _isDataLoaded = true;
          msg = body['msg'];
       });
      
      return;
    }
   
    if (body != null) {
     var rankData    = DivRanking.fromJson(body['divRanking']); // ranks for this division... 
     setState(() {
         divisionNames   = DivisionsLists.fromJson(body['divisionsLists']);
         seasonName = divisionNames.tournamentName;
         // add matches to the array 
          body['matches'].forEach((el) { 
            var sublist = el.map((val) => DivMatches.fromJson(val)).toList(); 
            divisionData.add(sublist); 
          }); 

          // add my matches 
          body['myMatches'].forEach((el) { 
            var sublist = el.map((val) => DivMatches.fromJson(val)).toList(); 
            myMatches.add(sublist); 
          }); 

          // dispatch the mymatch to the store... 
          store.dispatch(SingleDivMatch(myMatches));  // ONLY MY MATCHES 
          store.dispatch(DivisionData(divisionData));  // UPDATE DIVISIONS DATA TO STORE 
          store.dispatch(DivisionRank(rankData.ranks));  // UPDATE DIVISIONS RANK TO STORE 



        myDiv = body['myDiv']; // my division only 
       

        index = body['index'];
        divisionRanks = rankData.ranks;
        myRanks = rankData.ranks;
        hasData = true;
        _isDataLoaded = true;
      });


     
    }

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black,
          appBar: new AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                SizedBox(
                  width: 10,
                ),

                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: new Text(
                    '$seasonName',
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 21.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'BebasNeue',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                IconButton(
                  
                  icon: Image.asset("assets/img/result24px.png", color: _isShowMyMatchesOnly ? Colors.teal[300] : Colors.white,),//Icon(Icons.edit, size: 30, color: _isShowMyMatchesOnly ? Colors.teal[300] : Colors.white,), 
                  onPressed: (){
                      setState(() {
                          _isShowMyMatchesOnly = !_isShowMyMatchesOnly;
                          
                      });
                  },
                )
              ],
            ),
          ),
        body: _isDataLoaded && hasData ? BodyWidget
        (
          divisionNames,divisionData,index, divisionRanks, myDiv, myMatches, _isShowMyMatchesOnly, widget.isComingFromStanding, myRanks
        ) : _isDataLoaded && !hasData ? NoData() : DivisionLoaderAnimation()
    
      );
  }
}



class CenterCircel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child:  Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Container(
         color: Colors.grey[800],
         child:  Center(
           child: Text(//'No data found',
           FlutterI18n.translate(context, "No data found"),
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
    );
  }
}











                    
                    
                    






                    
                   