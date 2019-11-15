import 'state.dart';
import 'action.dart';

AppState reducer(AppState state, dynamic action){

  if(action is DemoAction){
    return state.copywith(
      demoState: action.demoAction
    );
  }

  if(action is SingleDivMatch){
    
     return state.copywith(
       myMatches: []..addAll(action.myMatches)
    );
  }
  if(action is DivisionData){
    
     return state.copywith(
       divMatches: []..addAll(action.match)
    );
  }
  if(action is DivisionRank){
     return state.copywith(
       divRank: []..addAll(action.divRank)
    );
  }


  if(action is UpdateDivResult){
    return state.copywith(
        myMatches: action.myMatches
    );

  }
  if(action is BottomNavigationChild){
    return state.copywith(
        bottomNavigationState: action.bottomNavigation
    );
  }
  if(action is AmricanoMatches){
   return state.copywith(
        amricanoMatches: action.amricanoMatches
    );
  }
  if(action is AmericanoRanks){
   return state.copywith(
        americanoRanks: action.americanoRanks
    );
  }
  if(action is UpdateAmericanoResult){
   return state.copywith(
        amricanoMatches: action.amricanoMatches
    );
  }
  if(action is HomePageData){
   
   return state.copywith(
        homePageData: action.homePageData
    );
  }
  if(action is TournamentData){
   return state.copywith(
        tournamentData: action.tournamentData
    );
  }
  if(action is ChangeBool){
    if(action.type==1){
      print('i was here');
      print(action.option);
      return state.copywith(
          isEmail: action.option
      );
    }
   
  }
  

  return state;
}