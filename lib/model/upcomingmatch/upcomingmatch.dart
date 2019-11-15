import 'package:json_annotation/json_annotation.dart';
part 'upcomingmatch.g.dart';

@JsonSerializable()
class MainData{ 
  final  List<UpcomingMatches> matches; 
  final List<CurrentDivs> currentDivs; 
  final List<MyClub> clubs;

  final bool success;
  final String msg;
  MainData(this.matches,this.currentDivs, this.success, this.msg, this.clubs);
  factory MainData.fromJson(Map<String, dynamic> json) =>
      _$MainDataFromJson(json);
  Map<String, dynamic> toJson() => _$MainDataToJson(this);
}

@JsonSerializable()
class MyClub{
  dynamic id; 
  final Club club; 
  MyClub(this.id, this.club);
  factory MyClub.fromJson(Map<String, dynamic> json) =>
      _$MyClubFromJson(json);
  Map<String, dynamic> toJson() => _$MyClubToJson(this);
}
@JsonSerializable()
class Club {
  dynamic id; 
  dynamic clubName; 
  dynamic logo; 
  Club(this.clubName, this.id, this.logo);
  factory Club.fromJson(Map<String, dynamic> json) =>
      _$ClubFromJson(json);
  Map<String, dynamic> toJson() => _$ClubToJson(this);
}


@JsonSerializable()
class UpcomingMatches {
  final dynamic id;
  final dynamic playingDate;
  final dynamic isPostponedRound;
  final dynamic courtName;
  final dynamic playingTime;
  final dynamic weekday;
  // final dynamic division_id;
  // final dynamic tmschedule_id;
  @JsonKey(name: "tournament_id")
  final dynamic trId;
  final dynamic round;
  final Home home;
  final Away away;
  final Div div;
  final Court court;
  final League league;
  final dynamic homeTeam;
  final dynamic awayTeam;
  dynamic cardType;
  dynamic dayName;

  // event data types...
  dynamic eventName;
  dynamic eventDate;
  dynamic eventTime;
  dynamic eventFee;
  dynamic eventLimit;
  dynamic eventLocation;
  dynamic eventImg;
  @JsonKey(name: "singedup_count")
  dynamic singedupCount;

  @JsonKey(name: "accepted_users")
  final List<AcceptedUsers> acceptedUsers;

  // americano 
  dynamic tournamentType;
  dynamic tournamentName;
  dynamic fee;
  dynamic startingTime;
  dynamic isPostponed;




  UpcomingMatches(
    this.id, this.playingDate, this.isPostponedRound, this.courtName, this.playingTime
    , this.weekday, this.round
    , this.home, this.away, this.div, this.court, this.homeTeam, this.awayTeam, this.trId, 
    this.cardType, this.eventDate, this.eventFee, this.eventLimit, this.eventName, this.eventTime, 
    this.eventLocation, this.fee, this.dayName, this.tournamentName, this.startingTime, this.tournamentType, this.league, this.eventImg, 
    this.isPostponed, this.singedupCount, this.acceptedUsers
    
  );

 
  factory UpcomingMatches.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMatchesFromJson(json);
  Map<String, dynamic> toJson() => _$UpcomingMatchesToJson(this);


}

@JsonSerializable()
class AcceptedUsers {
  dynamic id;
  dynamic event_id;
  dynamic user_id;
  dynamic status;
  final User user;


  AcceptedUsers(this.id, this.event_id, this.user_id, this.status, this.user  );
  factory AcceptedUsers.fromJson(Map<String, dynamic> json) =>
      _$AcceptedUsersFromJson(json);
  Map<String, dynamic> toJson() => _$AcceptedUsersToJson(this);
}

@JsonSerializable()
class User {
  dynamic id;
  dynamic firstName;
  dynamic lastName;
  dynamic profilePic;


  User(this.id, this.firstName, this.lastName, this.profilePic);
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}



@JsonSerializable()
class Home {
   final dynamic id;
   final dynamic teamName;
   final dynamic paymentStatus;
   final Player1 player1;
   final Player2 player2;
   Home(this.id, this.teamName, this.paymentStatus, this.player1, this.player2);
   
 
  factory Home.fromJson(Map<String, dynamic> json) =>
      _$HomeFromJson(json);
  Map<String, dynamic> toJson() => _$HomeToJson(this);

}
@JsonSerializable()
class Away{
   final dynamic id;
   final dynamic teamName;
   final dynamic paymentStatus;
   final Player1 player1;
   final Player2 player2;
   Away(this.id, this.teamName, this.paymentStatus, this.player1, this.player2);
 
  factory Away.fromJson(Map<String, dynamic> json) =>
      _$AwayFromJson(json);
  Map<String, dynamic> toJson() => _$AwayToJson(this);
}
@JsonSerializable()
class Div {
  final dynamic id;
  final dynamic divisionName;
  Div(this.id, this.divisionName);
 
  factory Div.fromJson(Map<String, dynamic> json) =>
      _$DivFromJson(json);
  Map<String, dynamic> toJson() => _$DivToJson(this);
}
@JsonSerializable()
class Court {
  final dynamic id;
  final dynamic courtName;
  Court(this.id, this.courtName);

 
  factory Court.fromJson(Map<String, dynamic> json) =>
      _$CourtFromJson(json);
  Map<String, dynamic> toJson() => _$CourtToJson(this);
}
@JsonSerializable()
class Tr {
  final dynamic id;
  final dynamic tournamentName;
  Tr(this.id, this.tournamentName);

 
  factory Tr.fromJson(Map<String, dynamic> json) =>
      _$TrFromJson(json);
  Map<String, dynamic> toJson() => _$TrToJson(this);
}



@JsonSerializable()
class Player1{
    final dynamic id;
    final dynamic profilePic;
    final dynamic firstName;
    final dynamic lastName;
    final dynamic phone;
    final dynamic email;
    Player1(this.id, this.profilePic, this.firstName, this.lastName, this.phone, this.email);
    
  factory Player1.fromJson(Map<String, dynamic> json) =>
      _$Player1FromJson(json);
  Map<String, dynamic> toJson() => _$Player1ToJson(this);
}
@JsonSerializable()
class Player2{
    final dynamic id;
    final dynamic profilePic;
    final dynamic firstName;
    final dynamic lastName;
    final dynamic phone;
    final dynamic email;
    Player2(this.id, this.profilePic, this.firstName, this.lastName, this.phone, this.email);
    
  factory Player2.fromJson(Map<String, dynamic> json) =>
      _$Player2FromJson(json);
  Map<String, dynamic> toJson() => _$Player2ToJson(this);
}
@JsonSerializable()
class CurrentDivs{
   dynamic matchPlayed;
   dynamic points;
   dynamic status;
   dynamic position;
   dynamic divisionName;
   dynamic teamName;
   final bool isDefault;
   dynamic trId;
   dynamic divId;
   dynamic tournamentName;
   CurrentDivs(this.isDefault, this.matchPlayed, this.points, this.status, this.position, this.divisionName, this.teamName, this.trId, this.divId, this.tournamentName); 
   factory CurrentDivs.fromJson(Map<String, dynamic> json) =>
      _$CurrentDivsFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentDivsToJson(this);

}


@JsonSerializable()
class League {
  final dynamic id;
  final dynamic leagueName;
  
  final Image image;
  League(this.id, this.leagueName, this.image);

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}
@JsonSerializable()
class Image {
  final dynamic image;
  Image(this.image);
  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}