// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcomingmatch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainData _$MainDataFromJson(Map<String, dynamic> json) {
  return MainData(
      (json['matches'] as List)
          ?.map((e) => e == null
              ? null
              : UpcomingMatches.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['currentDivs'] as List)
          ?.map((e) => e == null
              ? null
              : CurrentDivs.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['success'] as bool,
      json['msg'] as String,
      (json['clubs'] as List)
          ?.map((e) =>
              e == null ? null : MyClub.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MainDataToJson(MainData instance) => <String, dynamic>{
      'matches': instance.matches,
      'currentDivs': instance.currentDivs,
      'clubs': instance.clubs,
      'success': instance.success,
      'msg': instance.msg
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

UpcomingMatches _$UpcomingMatchesFromJson(Map<String, dynamic> json) {
  return UpcomingMatches(
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
      json['homeTeam'],
      json['awayTeam'],
      json['tournament_id'],
      json['cardType'],
      json['eventDate'],
      json['eventFee'],
      json['eventLimit'],
      json['eventName'],
      json['eventTime'],
      json['eventLocation'],
      json['fee'],
      json['dayName'],
      json['tournamentName'],
      json['startingTime'],
      json['tournamentType'],
      json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      json['eventImg'],
      json['isPostponed'],
      json['singedup_count'],
      (json['accepted_users'] as List)
          ?.map((e) => e == null
              ? null
              : AcceptedUsers.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$UpcomingMatchesToJson(UpcomingMatches instance) =>
    <String, dynamic>{
      'id': instance.id,
      'playingDate': instance.playingDate,
      'isPostponedRound': instance.isPostponedRound,
      'courtName': instance.courtName,
      'playingTime': instance.playingTime,
      'weekday': instance.weekday,
      'tournament_id': instance.trId,
      'round': instance.round,
      'home': instance.home,
      'away': instance.away,
      'div': instance.div,
      'court': instance.court,
      'league': instance.league,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'cardType': instance.cardType,
      'dayName': instance.dayName,
      'eventName': instance.eventName,
      'eventDate': instance.eventDate,
      'eventTime': instance.eventTime,
      'eventFee': instance.eventFee,
      'eventLimit': instance.eventLimit,
      'eventLocation': instance.eventLocation,
      'eventImg': instance.eventImg,
      'singedup_count': instance.singedupCount,
      'accepted_users': instance.acceptedUsers,
      'tournamentType': instance.tournamentType,
      'tournamentName': instance.tournamentName,
      'fee': instance.fee,
      'startingTime': instance.startingTime,
      'isPostponed': instance.isPostponed
    };

AcceptedUsers _$AcceptedUsersFromJson(Map<String, dynamic> json) {
  return AcceptedUsers(
      json['id'],
      json['event_id'],
      json['user_id'],
      json['status'],
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>));
}

Map<String, dynamic> _$AcceptedUsersToJson(AcceptedUsers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_id': instance.event_id,
      'user_id': instance.user_id,
      'status': instance.status,
      'user': instance.user
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['id'], json['firstName'], json['lastName'], json['profilePic']);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePic': instance.profilePic
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

Tr _$TrFromJson(Map<String, dynamic> json) {
  return Tr(json['id'], json['tournamentName']);
}

Map<String, dynamic> _$TrToJson(Tr instance) => <String, dynamic>{
      'id': instance.id,
      'tournamentName': instance.tournamentName
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

CurrentDivs _$CurrentDivsFromJson(Map<String, dynamic> json) {
  return CurrentDivs(
      json['isDefault'] as bool,
      json['matchPlayed'],
      json['points'],
      json['status'],
      json['position'],
      json['divisionName'],
      json['teamName'],
      json['trId'],
      json['divId'],
      json['tournamentName']);
}

Map<String, dynamic> _$CurrentDivsToJson(CurrentDivs instance) =>
    <String, dynamic>{
      'matchPlayed': instance.matchPlayed,
      'points': instance.points,
      'status': instance.status,
      'position': instance.position,
      'divisionName': instance.divisionName,
      'teamName': instance.teamName,
      'isDefault': instance.isDefault,
      'trId': instance.trId,
      'divId': instance.divId,
      'tournamentName': instance.tournamentName
    };

League _$LeagueFromJson(Map<String, dynamic> json) {
  return League(
      json['id'],
      json['leagueName'],
      json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'leagueName': instance.leagueName,
      'image': instance.image
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(json['image']);
}

Map<String, dynamic> _$ImageToJson(Image instance) =>
    <String, dynamic>{'image': instance.image};
