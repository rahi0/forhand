import 'package:json_annotation/json_annotation.dart';
part 'divData.g.dart';
@JsonSerializable()
class Division{
  bool success;
  List<DivMatches> matches; 
  DivisionsLists divisionsLists; 
  DivRanking divRanking; 
 

  Division(this.matches, this.divisionsLists, this.divRanking);
  factory Division.fromJson(Map<String, dynamic> json) =>
      _$DivisionFromJson(json);
  Map<String, dynamic> toJson() => _$DivisionToJson(this);
}
@JsonSerializable()
class DivisionsLists{
    dynamic tournamentName;
    dynamic tournamentType;
    List<Divs> div;

    DivisionsLists(this.tournamentName, this.tournamentType, this.div);
  factory DivisionsLists.fromJson(Map<String, dynamic> json) =>
      _$DivisionsListsFromJson(json);
  Map<String, dynamic> toJson() => _$DivisionsListsToJson(this);

}

@JsonSerializable()
class Divs {
  dynamic id;
  dynamic divisionName;
  bool isSelected;
  Divs(this.id, this.divisionName, this.isSelected);
  factory Divs.fromJson(Map<String, dynamic> json) =>
      _$DivsFromJson(json);
  Map<String, dynamic> toJson() => _$DivsToJson(this);
}

@JsonSerializable()
class DivMatches {
  dynamic id;
  var isOpen = false;
  @JsonKey(name: "tournament_id")
  dynamic tournamentId;
  @JsonKey(name: "division_id")
  dynamic divisionId;
  dynamic playingDate;
  dynamic isPostponedRound;
  dynamic courtName;
  dynamic playingTime;
  dynamic weekday;
  dynamic round;
  dynamic homeTeamPoint;
  dynamic awayTeamPoint;
  dynamic over;
  dynamic setOne;
  dynamic setTwo;
  dynamic setThree;
  dynamic homeTeam;
  dynamic awayTeam;
  dynamic isPostponed;
  dynamic dayName;
  Home home;
  Away away;
  Div div;
  Court court;


  DivMatches(
    this.id, this.playingDate, this.isPostponedRound, this.courtName, this.playingTime
    , this.weekday, this.round
    , this.home, this.away, this.div, this.court, this.awayTeamPoint, this.homeTeamPoint, this.over, this.setOne, this.setThree, this.setTwo,
    this.tournamentId, this.divisionId, this.homeTeam, this.awayTeam, this.isOpen, this.isPostponed, this.dayName
  );

 
  factory DivMatches.fromJson(Map<String, dynamic> json) =>
      _$DivMatchesFromJson(json);
  Map<String, dynamic> toJson() => _$DivMatchesToJson(this);


}
@JsonSerializable()
class Home {
  dynamic id;
  dynamic teamName;
  dynamic paymentStatus;
  Player1 player1;
  Player2 player2;
   Home(this.id, this.teamName, this.paymentStatus, this.player1, this.player2);
   
 
  factory Home.fromJson(Map<String, dynamic> json) =>
      _$HomeFromJson(json);
  Map<String, dynamic> toJson() => _$HomeToJson(this);

}
@JsonSerializable()
class Away{
  dynamic id;
  dynamic teamName;
  dynamic paymentStatus;
  Player1 player1;
  Player2 player2;
   Away(this.id, this.teamName, this.paymentStatus, this.player1, this.player2);
 
  factory Away.fromJson(Map<String, dynamic> json) =>
      _$AwayFromJson(json);
  Map<String, dynamic> toJson() => _$AwayToJson(this);
}
@JsonSerializable()
class Div {
  dynamic id;
  dynamic divisionName;
  Div(this.id, this.divisionName);
 
  factory Div.fromJson(Map<String, dynamic> json) =>
      _$DivFromJson(json);
  Map<String, dynamic> toJson() => _$DivToJson(this);
}
@JsonSerializable()
class Court {
  dynamic id;
  dynamic courtName;
  Court(this.id, this.courtName);

 
  factory Court.fromJson(Map<String, dynamic> json) =>
      _$CourtFromJson(json);
  Map<String, dynamic> toJson() => _$CourtToJson(this);
}
@JsonSerializable()
class Player1{
    dynamic id;
    dynamic profilePic;
    dynamic firstName;
    dynamic lastName;
    dynamic phone;
    dynamic email;
    Player1(this.id, this.profilePic, this.firstName, this.lastName, this.phone, this.email);
    
  factory Player1.fromJson(Map<String, dynamic> json) =>
      _$Player1FromJson(json);
  Map<String, dynamic> toJson() => _$Player1ToJson(this);
}
@JsonSerializable()
class Player2{
    dynamic id;
    dynamic profilePic;
    dynamic firstName;
    dynamic lastName;
    dynamic phone;
    dynamic email;
    Player2(this.id, this.profilePic, this.firstName, this.lastName, this.phone, this.email);
    
  factory Player2.fromJson(Map<String, dynamic> json) =>
      _$Player2FromJson(json);
  Map<String, dynamic> toJson() => _$Player2ToJson(this);
}

@JsonSerializable()
class Team{
  int id; 
  String teamName; 
  Player1 player1;
  Player1 player2;
   Team(this.id, this.teamName, this.player1, this.player2); 
   factory Team.fromJson(Map<String, dynamic> json) =>
      _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);

}
@JsonSerializable()
class DivRanking{
  dynamic isFull;
  List<Ranks> ranks; 
  DivRanking(this.isFull, this.ranks);
   factory DivRanking.fromJson(Map<String, dynamic> json) =>
      _$DivRankingFromJson(json);
  Map<String, dynamic> toJson() => _$DivRankingToJson(this);

}


@JsonSerializable()
class Ranks{
  dynamic won; 
  dynamic loss; 
  dynamic draw; 
  dynamic points; 
  dynamic matchePlayed; 
  dynamic totalSets; 
  dynamic totalGames; 
  dynamic status; 
  List<History> history;
  Team team;
  Ranks(
    this.won, this.loss, this.draw, this.points, this.matchePlayed, this.totalGames, 
    this.totalSets, this.team, this.history, this.status
  );
  factory Ranks.fromJson(Map<String, dynamic> json) =>
      _$RanksFromJson(json);
  Map<String, dynamic> toJson() => _$RanksToJson(this);
}
@JsonSerializable()
class History{
   dynamic winTxt;
   dynamic setOne;
   dynamic setTwo;
   dynamic setThree;
   dynamic homeTeamPoint;
   dynamic awayTeamPoint;
   Away team; 

   History(this.winTxt, this.setOne, this.setThree, this.setTwo, this.team, this.homeTeamPoint, this.awayTeamPoint);
   factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}
