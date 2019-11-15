import 'package:json_annotation/json_annotation.dart';
part 'teamStats.g.dart';

@JsonSerializable()
class TeamStats {
  final List<LastFive> lastFives;
  final List<CurrentDiv> currentDiv;
  final Team team;
  dynamic totalWon;
  dynamic totalLoss;
  dynamic totalDraw;
  dynamic totalMatches;
  

  TeamStats(this.lastFives, this.currentDiv, this.totalWon, this.totalLoss,
      this.totalDraw, this.totalMatches, this.team);
  factory TeamStats.fromJson(Map<String, dynamic> json) =>
      _$TeamStatsFromJson(json);
  Map<String, dynamic> toJson() => _$TeamStatsToJson(this);
}

@JsonSerializable()
class LastFive {
  final dynamic result;
  LastFive(this.result);

  factory LastFive.fromJson(Map<String, dynamic> json) =>
      _$LastFiveFromJson(json);
  Map<String, dynamic> toJson() => _$LastFiveToJson(this);
}

@JsonSerializable()
class CurrentDiv {
  final dynamic id;
  final dynamic isRunning;
  final Div div;

  CurrentDiv(this.id, this.isRunning, this.div);

  factory CurrentDiv.fromJson(Map<String, dynamic> json) =>
      _$CurrentDivFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentDivToJson(this);
}

@JsonSerializable()
class Div {
  final dynamic id;
  final dynamic divisionName;

  Div(this.id, this.divisionName);

  factory Div.fromJson(Map<String, dynamic> json) => _$DivFromJson(json);
  Map<String, dynamic> toJson() => _$DivToJson(this);
}

@JsonSerializable()
class Team {
 
  final dynamic id;
  final dynamic teamName;
  final Player1 player1;
  final Player2 player2;
  dynamic canSee;
  Team(this.id, this.teamName, this.player1, this.player2, this.canSee);
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
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
