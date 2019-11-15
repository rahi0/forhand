import 'package:json_annotation/json_annotation.dart';
part 'playerStats.g.dart';

@JsonSerializable()
class PlayerStats {
  bool isAmericanoPlaying;
  bool isDivPlaying;
  dynamic totalWon;
  dynamic canSee;
  dynamic totalLoss;
  dynamic totalDraw;
  dynamic totalMatches;
  final List<Team> team;
  final List<MyClub> myClub;
  final Player player;

  PlayerStats(this.isAmericanoPlaying, this.isDivPlaying, this.totalWon, this.totalLoss,
      this.totalDraw, this.totalMatches, this.team, this.player, this.myClub, this.canSee);
  factory PlayerStats.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerStatsToJson(this);
}




@JsonSerializable()
class Team {
  dynamic id;
  dynamic playerOneId;
  dynamic playerTwoId;
  dynamic teamName;
  dynamic paymentStatus;
  final Player1 player1;
  final Player2 player2;

  Team(this.id, this.playerOneId, this.playerTwoId, this.teamName,
        this.paymentStatus, this.player1, this.player2);
  factory Team.fromJson(Map<String, dynamic> json) =>
      _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}


@JsonSerializable()
class Player1 {
  final dynamic id;
  final dynamic profilePic;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic phone;
  final dynamic email;
  Player1(this.id, this.profilePic, this.firstName, this.lastName, this.phone,
      this.email);

  factory Player1.fromJson(Map<String, dynamic> json) =>
      _$Player1FromJson(json);
  Map<String, dynamic> toJson() => _$Player1ToJson(this);
}

@JsonSerializable()
class Player2 {
  final dynamic id;
  final dynamic profilePic;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic phone;
  final dynamic email;
  Player2(this.id, this.profilePic, this.firstName, this.lastName, this.phone,
      this.email);

  factory Player2.fromJson(Map<String, dynamic> json) =>
      _$Player2FromJson(json);
  Map<String, dynamic> toJson() => _$Player2ToJson(this);
}



@JsonSerializable()
class Player {
  final dynamic id;
  final dynamic profilePic;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic phone;
  final dynamic email;
  final dynamic racket;
  final dynamic playingHand;
  final dynamic state;
  final dynamic dob;
  Player(this.id, this.profilePic, this.firstName, this.lastName, this.phone,
      this.email, this.playingHand, this.racket, this.state, this.dob);

  factory Player.fromJson(Map<String, dynamic> json) =>
      _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
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