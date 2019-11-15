// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playerStats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerStats _$PlayerStatsFromJson(Map<String, dynamic> json) {
  return PlayerStats(
      json['isAmericanoPlaying'] as bool,
      json['isDivPlaying'] as bool,
      json['totalWon'],
      json['totalLoss'],
      json['totalDraw'],
      json['totalMatches'],
      (json['team'] as List)
          ?.map((e) =>
              e == null ? null : Team.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['player'] == null
          ? null
          : Player.fromJson(json['player'] as Map<String, dynamic>),
      (json['myClub'] as List)
          ?.map((e) =>
              e == null ? null : MyClub.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['canSee']);
}

Map<String, dynamic> _$PlayerStatsToJson(PlayerStats instance) =>
    <String, dynamic>{
      'isAmericanoPlaying': instance.isAmericanoPlaying,
      'isDivPlaying': instance.isDivPlaying,
      'totalWon': instance.totalWon,
      'canSee': instance.canSee,
      'totalLoss': instance.totalLoss,
      'totalDraw': instance.totalDraw,
      'totalMatches': instance.totalMatches,
      'team': instance.team,
      'myClub': instance.myClub,
      'player': instance.player
    };

Team _$TeamFromJson(Map<String, dynamic> json) {
  return Team(
      json['id'],
      json['playerOneId'],
      json['playerTwoId'],
      json['teamName'],
      json['paymentStatus'],
      json['player1'] == null
          ? null
          : Player1.fromJson(json['player1'] as Map<String, dynamic>),
      json['player2'] == null
          ? null
          : Player2.fromJson(json['player2'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'playerOneId': instance.playerOneId,
      'playerTwoId': instance.playerTwoId,
      'teamName': instance.teamName,
      'paymentStatus': instance.paymentStatus,
      'player1': instance.player1,
      'player2': instance.player2
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

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
      json['id'],
      json['profilePic'],
      json['firstName'],
      json['lastName'],
      json['phone'],
      json['email'],
      json['playingHand'],
      json['racket'],
      json['state'],
      json['dob']);
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'profilePic': instance.profilePic,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
      'racket': instance.racket,
      'playingHand': instance.playingHand,
      'state': instance.state,
      'dob': instance.dob
    };

MyClub _$MyClubFromJson(Map<String, dynamic> json) {
  return MyClub(
      json['id'],
      json['club'] == null
          ? null
          : Club.fromJson(json['club'] as Map<String, dynamic>));
}

Map<String, dynamic> _$MyClubToJson(MyClub instance) =>
    <String, dynamic>{'id': instance.id, 'club': instance.club};

Club _$ClubFromJson(Map<String, dynamic> json) {
  return Club(json['clubName'], json['id'], json['logo']);
}

Map<String, dynamic> _$ClubToJson(Club instance) => <String, dynamic>{
      'id': instance.id,
      'clubName': instance.clubName,
      'logo': instance.logo
    };
