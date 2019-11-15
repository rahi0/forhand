// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teamList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamList _$TeamListFromJson(Map<String, dynamic> json) {
  return TeamList((json['teams'] as List)
      ?.map((e) => e == null ? null : Teams.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$TeamListToJson(TeamList instance) =>
    <String, dynamic>{'teams': instance.teams};

Teams _$TeamsFromJson(Map<String, dynamic> json) {
  return Teams(
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

Map<String, dynamic> _$TeamsToJson(Teams instance) => <String, dynamic>{
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
