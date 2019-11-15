class AppState {
  var demoState;
  List myMatches;
  List divMatches;
  List divRank;
  List amricanoMatches;
  var americanoRanks;
  int bottomNavigationState;
  var homePageData;
  var tournamentData;
  bool isEmail; 
  bool isPin; 
  bool isReset;
  

  AppState({this.demoState, this.myMatches, this.divMatches, this.divRank, this.bottomNavigationState, this.amricanoMatches, this.americanoRanks,
          this.homePageData, this.tournamentData, this.isEmail, this.isPin, this.isReset
  
  });

  AppState copywith({demoState, myMatches, divMatches, divRank, bottomNavigationState, amricanoMatches, americanoRanks, homePageData,
     tournamentData, isEmail, isPin, isReset
  }){
    return AppState(
      myMatches : myMatches ?? this.myMatches,
      divMatches : divMatches ?? this.divMatches,
      divRank : divRank ?? this.divRank,
      demoState: demoState ?? this.demoState,
      bottomNavigationState: bottomNavigationState ?? this.bottomNavigationState,
      amricanoMatches: amricanoMatches ?? this.amricanoMatches,
      americanoRanks: americanoRanks ?? this.americanoRanks,
      homePageData: homePageData ?? this.homePageData,
      tournamentData: tournamentData ?? this.tournamentData,
      isEmail: isEmail ?? this.isEmail,
      isPin: isPin ?? this.isPin,
      isReset: isReset ?? this.isReset,
    );
    
  }
}