import 'package:json_annotation/json_annotation.dart';
part 'americanoModel.g.dart';
@JsonSerializable()
class AmericanoModel {
  bool success; 
  final List<Matches> matches; 
  final AmericanoPoints points; 
  final Tr tr; 
  AmericanoModel(this.success, this.matches, this.points, this.tr);
  factory AmericanoModel.fromJson(Map<String, dynamic> json) =>
      _$AmericanoModelFromJson(json);
  Map<String, dynamic> toJson() => _$AmericanoModelToJson(this);

}

@JsonSerializable()
class Matches {
  dynamic id; 
  dynamic over; 
  dynamic teamOnePoints; 
  dynamic teamTwoPoints; 
  dynamic playerOne; 
  dynamic playerTwo; 
  dynamic playerThree; 
  dynamic playerFour; 
  dynamic groupName; 
  dynamic canEdit; 
   @JsonKey(name: "tournament_id")
  dynamic tournamentId;
  final Player player1;
  final Player player2;
  final Player player3;
  final Player player4;
  final Court court;

  
   Matches(this.id, this.over, this.teamOnePoints, this.teamTwoPoints, this.playerThree, this.playerFour, this.groupName,
            this.player1, this.player2, this.player3, this.player4, this.court, this.tournamentId, this.canEdit);
  factory Matches.fromJson(Map<String, dynamic> json) =>
      _$MatchesFromJson(json);
  Map<String, dynamic> toJson() => _$MatchesToJson(this);

}
@JsonSerializable()
class Player{
    dynamic id; 
    dynamic firstName; 
    dynamic lastName; 
    dynamic profilePic; 
    Player(this.id, this.firstName, this.lastName, this.profilePic);
  factory Player.fromJson(Map<String, dynamic> json) =>
      _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);

}
@JsonSerializable()
class Court{
  dynamic courtName;
  Court(this.courtName);
  factory Court.fromJson(Map<String, dynamic> json) =>
      _$CourtFromJson(json);
  Map<String, dynamic> toJson() => _$CourtToJson(this);

}

@JsonSerializable()
class AmericanoPoints{
  dynamic isFull;
  final List<Points> ranks; 
  AmericanoPoints(this.isFull, this.ranks);
   factory AmericanoPoints.fromJson(Map<String, dynamic> json) =>
      _$AmericanoPointsFromJson(json);
  Map<String, dynamic> toJson() => _$AmericanoPointsToJson(this);

}

@JsonSerializable()
class Points {
   dynamic round1;
   dynamic round2;
   dynamic round3;
   dynamic round4;
   dynamic round5;
   dynamic round6;
   dynamic round7;
   dynamic total;
   final Player player; 
   Points(
     this.round1,this.player, this.round2, this.round3, this.round4, this.round5, this.round6, this.round7, 
     this.total
   );
  factory Points.fromJson(Map<String, dynamic> json) =>
      _$PointsFromJson(json);
  Map<String, dynamic> toJson() => _$PointsToJson(this);

}
@JsonSerializable()
class Tr{
    dynamic id; 
    dynamic tournamentName;
    final League league; 
    Tr(this.id, this.league, this.tournamentName);
     factory Tr.fromJson(Map<String, dynamic> json) =>
      _$TrFromJson(json);
  Map<String, dynamic> toJson() => _$TrToJson(this);
}

@JsonSerializable()
class League{
    final dynamic id;
  final dynamic leagueName;
  final dynamic competitionType;
  final dynamic sportType;
  
  final Club club;
  final Pic image;
    final List<Managers> managers;




   League(this.club, this.id, this.image, this.competitionType, this.leagueName, this.sportType, this.managers);
   factory League.fromJson(Map<String, dynamic> json) =>
      _$LeagueFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}
@JsonSerializable()
class Managers {
  final dynamic id;
  final User user;

  Managers(this.id, this.user);

  factory Managers.fromJson(Map<String, dynamic> json) =>
      _$ManagersFromJson(json);
  Map<String, dynamic> toJson() => _$ManagersToJson(this);
}
@JsonSerializable()
class Club {
  dynamic id; 
  dynamic clubName; 
  dynamic logo; 
  dynamic city; 
  Club(this.clubName, this.id, this.logo, this.city);
  factory Club.fromJson(Map<String, dynamic> json) =>
      _$ClubFromJson(json);
  Map<String, dynamic> toJson() => _$ClubToJson(this);
}
@JsonSerializable()
class Pic {
  final dynamic image;
  Pic(this.image);
  factory Pic.fromJson(Map<String, dynamic> json) =>
      _$PicFromJson(json);
  Map<String, dynamic> toJson() => _$PicToJson(this);
}

@JsonSerializable()
class User {
  final dynamic id;
  final dynamic profilePic;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic phone;
  final dynamic email;

  User(this.id, this.profilePic, this.firstName, this.lastName, this.phone,
      this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
