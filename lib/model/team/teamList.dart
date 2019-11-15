import 'package:json_annotation/json_annotation.dart';
part 'teamList.g.dart';

@JsonSerializable()

class TeamList{
   List<Teams> teams;
   TeamList(this.teams);
   factory TeamList.fromJson(Map<String, dynamic> json) =>
      _$TeamListFromJson(json);
  Map<String, dynamic> toJson() => _$TeamListToJson(this);

}

@JsonSerializable()
class Teams{
   dynamic id;
   dynamic playerOneId;
   dynamic playerTwoId;
   dynamic teamName;
   dynamic paymentStatus;
   final Player1 player1;
  final Player2 player2;

   Teams(this.id, this.playerOneId, this.playerTwoId, this.teamName, this.paymentStatus, this.player1, this.player2);
   factory Teams.fromJson(Map<String, dynamic> json) =>
      _$TeamsFromJson(json);
  Map<String, dynamic> toJson() => _$TeamsToJson(this);
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