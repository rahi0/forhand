import 'dart:convert';

import 'package:padelmatchv2/api/api.dart';
import 'package:padelmatchv2/model/upcomingmatch/upcomingmatch.dart';

import 'state.dart';
import 'action.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';



ThunkAction<AppState> changeResult(id, data) => (Store <AppState> store) async{
    var match = store.state.myMatches;
    for(var d in match){
       for(var m in d){
          if(m.id==id){
             m.homeTeamPoint = data['homeTeamPoint'];
             m.awayTeamPoint = data['awayTeamPoint'];
             m.setOne = data['setOne'];
             m.setTwo = data['setTwo'];
             m.setThree = data['setThree'];
             m.over = data['over'];
          }
       }
    }
    store.dispatch(UpdateDivResult(match));
};
ThunkAction<AppState> changeAmericanoResult(id, data) => (Store <AppState> store) async{
  var match = store.state.amricanoMatches;
  for(var d in match){
      for(var m in d){
        if(m.id==id){
            m.teamOnePoints = data['teamOnePoints'];
            m.teamTwoPoints = data['teamTwoPoints'];
        }
      }
  }
  store.dispatch(UpdateAmericanoResult(match));
};


ThunkAction<AppState> getHomePageData = (Store<AppState> store) async {
    var res = await CallApi().getData('upcoming-matches');
    final body = json.decode(res.body);
    var homePageData;
    if (body != null) {
      homePageData = MainData.fromJson(body);
    }
    store.dispatch(HomePageData(homePageData));
    print('i am should first');
 
};