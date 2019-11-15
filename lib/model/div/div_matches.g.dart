// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'div_matches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DivMatches _$DivMatchesFromJson(Map<String, dynamic> json) {
  return DivMatches((json['matches'] as List)
      ?.map((e) => e == null ? null : Match.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$DivMatchesToJson(DivMatches instance) =>
    <String, dynamic>{'matches': instance.matches};

Match _$MatchFromJson(Map<String, dynamic> json) {
  return Match(
      json['id'],
      json['playingDate'],
      json['isPostponedRound'],
      json['courtName'],
      json['playingTime'],
      json['weekday'],
      json['round'],
      json['home'] == null
          ? null
          : Home.fromJson(json['home'] as Map<String, dynamic>),
      json['away'] == null
          ? null
          : Away.fromJson(json['away'] as Map<String, dynamic>),
      json['div'] == null
          ? null
          : Div.fromJson(json['div'] as Map<String, dynamic>),
      json['court'] == null
          ? null
          : Court.fromJson(json['court'] as Map<String, dynamic>),
      json['awayTeamPoint'],
      json['homeTeamPoint'],
      json['over'],
      json['homeTeam'],
      json['awayTeam']);
}

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'id': instance.id,
      'playingDate': instance.playingDate,
      'isPostponedRound': instance.isPostponedRound,
      'courtName': instance.courtName,
      'playingTime': instance.playingTime,
      'weekday': instance.weekday,
      'round': instance.round,
      'homeTeamPoint': instance.homeTeamPoint,
      'awayTeamPoint': instance.awayTeamPoint,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'over': instance.over,
      'home': instance.home,
      'away': instance.away,
      'div': instance.div,
      'court': instance.court
    };

Home _$HomeFromJson(Map<String, dynamic> json) {
  return Home(
      json['id'],
      json['teamName'],
      json['paymentStatus'],
      json['player1'] == null
          ? null
          : Player1.fromJson(json['player1'] as Map<String, dynamic>),
      json['player2'] == null
          ? null
          : Player2.fromJson(json['player2'] as Map<String, dynamic>));
}

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'id': instance.id,
      'teamName': instance.teamName,
      'paymentStatus': instance.paymentStatus,
      'player1': instance.player1,
      'player2': instance.player2
    };

Away _$AwayFromJson(Map<String, dynamic> json) {
  return Away(
      json['id'],
      json['teamName'],
      json['paymentStatus'],
      json['player1'] == null
          ? null
          : Player1.fromJson(json['player1'] as Map<String, dynamic>),
      json['player2'] == null
          ? null
          : Player2.fromJson(json['player2'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AwayToJson(Away instance) => <String, dynamic>{
      'id': instance.id,
      'teamName': instance.teamName,
      'paymentStatus': instance.paymentStatus,
      'player1': instance.player1,
      'player2': instance.player2
    };

Div _$DivFromJson(Map<String, dynamic> json) {
  return Div(json['id'], json['divisionName']);
}

Map<String, dynamic> _$DivToJson(Div instance) =>
    <String, dynamic>{'id': instance.id, 'divisionName': instance.divisionName};

Court _$CourtFromJson(Map<String, dynamic> json) {
  return Court(json['id'], json['courtName']);
}

Map<String, dynamic> _$CourtToJson(Court instance) =>
    <String, dynamic>{'id': instance.id, 'courtName': instance.courtName};

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

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(json['id'] as int, json['teamName'] as String);
}

Map<String, dynamic> _$TeamToJson(Team instance) =>
    <String, dynamic>{'id': instance.id, 'teamName': instance.teamName};
