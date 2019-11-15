// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teamStats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamStats _$TeamStatsFromJson(Map<String, dynamic> json) {
  return TeamStats(
      (json['lastFives'] as List)
          ?.map((e) =>
              e == null ? null : LastFive.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['currentDiv'] as List)
          ?.map((e) =>
              e == null ? null : CurrentDiv.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['totalWon'],
      json['totalLoss'],
      json['totalDraw'],
      json['totalMatches'],
      json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TeamStatsToJson(TeamStats instance) => <String, dynamic>{
      'lastFives': instance.lastFives,
      'currentDiv': instance.currentDiv,
      'team': instance.team,
      'totalWon': instance.totalWon,
      'totalLoss': instance.totalLoss,
      'totalDraw': instance.totalDraw,
      'totalMatches': instance.totalMatches
    };

LastFive _$LastFiveFromJson(Map<String, dynamic> json) {
  return LastFive(json['result']);
}

Map<String, dynamic> _$LastFiveToJson(LastFive instance) =>
    <String, dynamic>{'result': instance.result};

CurrentDiv _$CurrentDivFromJson(Map<String, dynamic> json) {
  return CurrentDiv(
      json['id'],
      json['isRunning'],
      json['div'] == null
          ? null
          : Div.fromJson(json['div'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CurrentDivToJson(CurrentDiv instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isRunning': instance.isRunning,
      'div': instance.div
    };

Div _$DivFromJson(Map<String, dynamic> json) {
  return Div(json['id'], json['divisionName']);
}

Map<String, dynamic> _$DivToJson(Div instance) =>
    <String, dynamic>{'id': instance.id, 'divisionName': instance.divisionName};

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
      json['id'],
      json['teamName'],
      json['player1'] == null
          ? null
          : Player1.fromJson(json['player1'] as Map<String, dynamic>),
      json['player2'] == null
          ? null
          : Player2.fromJson(json['player2'] as Map<String, dynamic>),
      json['canSee']);
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'teamName': instance.teamName,
      'player1': instance.player1,
      'player2': instance.player2,
      'canSee': instance.canSee
    };

Player1 _$Player1FromJson(Map<String, dynamic> json) {
  return Player1(json['id'], json['profilePic'], json['firstName'],
      json['lastName'], json['phone'], json['email']);
}

Map<String, dynamic> _$Player1ToJson(Player1 instance) => <String, dynamic>{
      'id': instance.id,
      'profilePic': instance.profilePic,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email
    };

Player2 _$Player2FromJson(Map<String, dynamic> json) {
  return Player2(json['id'], json['profilePic'], json['firstName'],
      json['lastName'], json['phone'], json['email']);
}

Map<String, dynamic> _$Player2ToJson(Player2 instance) => <String, dynamic>{
      'id': instance.id,
      'profilePic': instance.profilePic,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email
    };
