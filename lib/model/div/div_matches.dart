import 'package:json_annotation/json_annotation.dart';
part 'div_matches.g.dart';

@JsonSerializable()
class DivMatches{
  List<Match> matches;
  DivMatches(this.matches);
  factory DivMatches.fromJson(Map<String, dynamic> json) =>
      _$DivMatchesFromJson(json);
  Map<String, dynamic> toJson() => _$DivMatchesToJson(this);

}

@JsonSerializable()
class Match {
   dynamic id;
   dynamic playingDate;
   dynamic isPostponedRound;
   dynamic courtName;
   dynamic playingTime;
   dynamic weekday;
   dynamic round;
   dynamic homeTeamPoint;
   dynamic awayTeamPoint;
   dynamic homeTeam;
   dynamic awayTeam;
   dynamic over;
   Home home;
   Away away;
   Div div;
   Court court;


  Match(
    this.id, this.playingDate, this.isPostponedRound, this.courtName, this.playingTime
    , this.weekday, this.round
    , this.home, this.away, this.div, this.court, this.awayTeamPoint, this.homeTeamPoint, this.over, this.homeTeam, this.awayTeam
  );

 
  factory Match.fromJson(Map<String, dynamic> json) =>
      _$MatchFromJson(json);
  Map<String, dynamic> toJson() => _$MatchToJson(this);


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
   Team(this.id, this.teamName); 
   factory Team.fromJson(Map<String, dynamic> json) =>
      _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);

}
