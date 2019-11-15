// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'divData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Division _$DivisionFromJson(Map<String, dynamic> json) {
  return Division(
      (json['matches'] as List)
          ?.map((e) =>
              e == null ? null : DivMatches.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['divisionsLists'] == null
          ? null
          : DivisionsLists.fromJson(
              json['divisionsLists'] as Map<String, dynamic>),
      json['divRanking'] == null
          ? null
          : DivRanking.fromJson(json['divRanking'] as Map<String, dynamic>))
    ..success = json['success'] as bool;
}

Map<String, dynamic> _$DivisionToJson(Division instance) => <String, dynamic>{
      'success': instance.success,
      'matches': instance.matches,
      'divisionsLists': instance.divisionsLists,
      'divRanking': instance.divRanking
    };

DivisionsLists _$DivisionsListsFromJson(Map<String, dynamic> json) {
  return DivisionsLists(
      json['tournamentName'],
      json['tournamentType'],
      (json['div'] as List)
          ?.map((e) =>
              e == null ? null : Divs.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DivisionsListsToJson(DivisionsLists instance) =>
    <String, dynamic>{
      'tournamentName': instance.tournamentName,
      'tournamentType': instance.tournamentType,
      'div': instance.div
    };

Divs _$DivsFromJson(Map<String, dynamic> json) {
  return Divs(json['id'], json['divisionName'], json['isSelected'] as bool);
}

Map<String, dynamic> _$DivsToJson(Divs instance) => <String, dynamic>{
      'id': instance.id,
      'divisionName': instance.divisionName,
      'isSelected': instance.isSelected
    };

DivMatches _$DivMatchesFromJson(Map<String, dynamic> json) {
  return DivMatches(
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
      json['setOne'],
      json['setThree'],
      json['setTwo'],
      json['tournament_id'],
      json['division_id'],
      json['homeTeam'],
      json['awayTeam'],
      json['isOpen'] as bool,
      json['isPostponed'],
      json['dayName']);
}

Map<String, dynamic> _$DivMatchesToJson(DivMatches instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isOpen': instance.isOpen,
      'tournament_id': instance.tournamentId,
      'division_id': instance.divisionId,
      'playingDate': instance.playingDate,
      'isPostponedRound': instance.isPostponedRound,
      'courtName': instance.courtName,
      'playingTime': instance.playingTime,
      'weekday': instance.weekday,
      'round': instance.round,
      'homeTeamPoint': instance.homeTeamPoint,
      'awayTeamPoint': instance.awayTeamPoint,
      'over': instance.over,
      'setOne': instance.setOne,
      'setTwo': instance.setTwo,
      'setThree': instance.setThree,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'isPostponed': instance.isPostponed,
      'dayName': instance.dayName,
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
  return Team(
      json['id'] as int,
      json['teamName'] as String,
      json['player1'] == null
          ? null
          : Player1.fromJson(json['player1'] as Map<String, dynamic>),
      json['player2'] == null
          ? null
          : Player1.fromJson(json['player2'] as Map<String, dynamic>));
}

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'teamName': instance.teamName,
      'player1': instance.player1,
      'player2': instance.player2
    };

DivRanking _$DivRankingFromJson(Map<String, dynamic> json) {
  return DivRanking(
      json['isFull'],
      (json['ranks'] as List)
          ?.map((e) =>
              e == null ? null : Ranks.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DivRankingToJson(DivRanking instance) =>
    <String, dynamic>{'isFull': instance.isFull, 'ranks': instance.ranks};

Ranks _$RanksFromJson(Map<String, dynamic> json) {
  return Ranks(
      json['won'],
      json['loss'],
      json['draw'],
      json['points'],
      json['matchePlayed'],
      json['totalGames'],
      json['totalSets'],
      json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      (json['history'] as List)
          ?.map((e) =>
              e == null ? null : History.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['status']);
}

Map<String, dynamic> _$RanksToJson(Ranks instance) => <String, dynamic>{
      'won': instance.won,
      'loss': instance.loss,
      'draw': instance.draw,
      'points': instance.points,
      'matchePlayed': instance.matchePlayed,
      'totalSets': instance.totalSets,
      'totalGames': instance.totalGames,
      'status': instance.status,
      'history': instance.history,
      'team': instance.team
    };

History _$HistoryFromJson(Map<String, dynamic> json) {
  return History(
      json['winTxt'],
      json['setOne'],
      json['setThree'],
      json['setTwo'],
      json['team'] == null
          ? null
          : Away.fromJson(json['team'] as Map<String, dynamic>),
      json['homeTeamPoint'],
      json['awayTeamPoint']);
}

Map<String, dynamic> _$HistoryToJson(History instance) => <String, dynamic>{
      'winTxt': instance.winTxt,
      'setOne': instance.setOne,
      'setTwo': instance.setTwo,
      'setThree': instance.setThree,
      'homeTeamPoint': instance.homeTeamPoint,
      'awayTeamPoint': instance.awayTeamPoint,
      'team': instance.team
    };
