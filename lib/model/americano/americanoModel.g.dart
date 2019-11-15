// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'americanoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmericanoModel _$AmericanoModelFromJson(Map<String, dynamic> json) {
  return AmericanoModel(
      json['success'] as bool,
      (json['matches'] as List)
          ?.map((e) =>
              e == null ? null : Matches.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['points'] == null
          ? null
          : AmericanoPoints.fromJson(json['points'] as Map<String, dynamic>),
      json['tr'] == null
          ? null
          : Tr.fromJson(json['tr'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AmericanoModelToJson(AmericanoModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'matches': instance.matches,
      'points': instance.points,
      'tr': instance.tr
    };

Matches _$MatchesFromJson(Map<String, dynamic> json) {
  return Matches(
      json['id'],
      json['over'],
      json['teamOnePoints'],
      json['teamTwoPoints'],
      json['playerThree'],
      json['playerFour'],
      json['groupName'],
      json['player1'] == null
          ? null
          : Player.fromJson(json['player1'] as Map<String, dynamic>),
      json['player2'] == null
          ? null
          : Player.fromJson(json['player2'] as Map<String, dynamic>),
      json['player3'] == null
          ? null
          : Player.fromJson(json['player3'] as Map<String, dynamic>),
      json['player4'] == null
          ? null
          : Player.fromJson(json['player4'] as Map<String, dynamic>),
      json['court'] == null
          ? null
          : Court.fromJson(json['court'] as Map<String, dynamic>),
      json['tournament_id'],
      json['canEdit'])
    ..playerOne = json['playerOne']
    ..playerTwo = json['playerTwo'];
}

Map<String, dynamic> _$MatchesToJson(Matches instance) => <String, dynamic>{
      'id': instance.id,
      'over': instance.over,
      'teamOnePoints': instance.teamOnePoints,
      'teamTwoPoints': instance.teamTwoPoints,
      'playerOne': instance.playerOne,
      'playerTwo': instance.playerTwo,
      'playerThree': instance.playerThree,
      'playerFour': instance.playerFour,
      'groupName': instance.groupName,
      'canEdit': instance.canEdit,
      'tournament_id': instance.tournamentId,
      'player1': instance.player1,
      'player2': instance.player2,
      'player3': instance.player3,
      'player4': instance.player4,
      'court': instance.court
    };

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return Player(
      json['id'], json['firstName'], json['lastName'], json['profilePic']);
}

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePic': instance.profilePic
    };

Court _$CourtFromJson(Map<String, dynamic> json) {
  return Court(json['courtName']);
}

Map<String, dynamic> _$CourtToJson(Court instance) =>
    <String, dynamic>{'courtName': instance.courtName};

AmericanoPoints _$AmericanoPointsFromJson(Map<String, dynamic> json) {
  return AmericanoPoints(
      json['isFull'],
      (json['ranks'] as List)
          ?.map((e) =>
              e == null ? null : Points.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AmericanoPointsToJson(AmericanoPoints instance) =>
    <String, dynamic>{'isFull': instance.isFull, 'ranks': instance.ranks};

Points _$PointsFromJson(Map<String, dynamic> json) {
  return Points(
      json['round1'],
      json['player'] == null
          ? null
          : Player.fromJson(json['player'] as Map<String, dynamic>),
      json['round2'],
      json['round3'],
      json['round4'],
      json['round5'],
      json['round6'],
      json['round7'],
      json['total']);
}

Map<String, dynamic> _$PointsToJson(Points instance) => <String, dynamic>{
      'round1': instance.round1,
      'round2': instance.round2,
      'round3': instance.round3,
      'round4': instance.round4,
      'round5': instance.round5,
      'round6': instance.round6,
      'round7': instance.round7,
      'total': instance.total,
      'player': instance.player
    };

Tr _$TrFromJson(Map<String, dynamic> json) {
  return Tr(
      json['id'],
      json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      json['tournamentName']);
}

Map<String, dynamic> _$TrToJson(Tr instance) => <String, dynamic>{
      'id': instance.id,
      'tournamentName': instance.tournamentName,
      'league': instance.league
    };

League _$LeagueFromJson(Map<String, dynamic> json) {
  return League(
      json['club'] == null
          ? null
          : Club.fromJson(json['club'] as Map<String, dynamic>),
      json['id'],
      json['image'] == null
          ? null
          : Pic.fromJson(json['image'] as Map<String, dynamic>),
      json['competitionType'],
      json['leagueName'],
      json['sportType'],
      (json['managers'] as List)
          ?.map((e) =>
              e == null ? null : Managers.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'leagueName': instance.leagueName,
      'competitionType': instance.competitionType,
      'sportType': instance.sportType,
      'club': instance.club,
      'image': instance.image,
      'managers': instance.managers
    };

Managers _$ManagersFromJson(Map<String, dynamic> json) {
  return Managers(
      json['id'],
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ManagersToJson(Managers instance) =>
    <String, dynamic>{'id': instance.id, 'user': instance.user};

Club _$ClubFromJson(Map<String, dynamic> json) {
  return Club(json['clubName'], json['id'], json['logo'], json['city']);
}

Map<String, dynamic> _$ClubToJson(Club instance) => <String, dynamic>{
      'id': instance.id,
      'clubName': instance.clubName,
      'logo': instance.logo,
      'city': instance.city
    };

Pic _$PicFromJson(Map<String, dynamic> json) {
  return Pic(json['image']);
}

Map<String, dynamic> _$PicToJson(Pic instance) =>
    <String, dynamic>{'image': instance.image};

User _$UserFromJson(Map<String, dynamic> json) {
  return User(json['id'], json['profilePic'], json['firstName'],
      json['lastName'], json['phone'], json['email']);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'profilePic': instance.profilePic,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email
    };
