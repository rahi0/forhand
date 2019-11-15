// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournamentAndEvent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentAndEvent _$TournamentAndEventFromJson(Map<String, dynamic> json) {
  return TournamentAndEvent(
      (json['completedTr'] as List)
          ?.map((e) => e == null
              ? null
              : CompletedLeagues.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['events'] as List)
          ?.map((e) =>
              e == null ? null : Events.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['runningTr'] as List)
          ?.map((e) => e == null
              ? null
              : RunningLeagues.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['americnoInvites'] as List)
          ?.map((e) => e == null
              ? null
              : AmericnoInvites.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TournamentAndEventToJson(TournamentAndEvent instance) =>
    <String, dynamic>{
      'runningTr': instance.runningTr,
      'completedTr': instance.completedTr,
      'events': instance.events,
      'americnoInvites': instance.americnoInvites
    };

RunningLeagues _$RunningLeaguesFromJson(Map<String, dynamic> json) {
  return RunningLeagues(
      json['id'],
      json['leagueName'],
      (json['managers'] as List)
          ?.map((e) =>
              e == null ? null : Managers.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['sportType'],
      json['competitionType'],
      json['club'] == null
          ? null
          : Club.fromJson(json['club'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>));
}

Map<String, dynamic> _$RunningLeaguesToJson(RunningLeagues instance) =>
    <String, dynamic>{
      'id': instance.id,
      'leagueName': instance.leagueName,
      'competitionType': instance.competitionType,
      'sportType': instance.sportType,
      'managers': instance.managers,
      'club': instance.club,
      'image': instance.image
    };

CompletedLeagues _$CompletedLeaguesFromJson(Map<String, dynamic> json) {
  return CompletedLeagues(
      json['id'],
      json['leagueName'],
      (json['managers'] as List)
          ?.map((e) =>
              e == null ? null : Managers.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['sportType'],
      json['competitionType'],
      json['club'] == null
          ? null
          : Club.fromJson(json['club'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>));
}

Map<String, dynamic> _$CompletedLeaguesToJson(CompletedLeagues instance) =>
    <String, dynamic>{
      'id': instance.id,
      'leagueName': instance.leagueName,
      'competitionType': instance.competitionType,
      'sportType': instance.sportType,
      'managers': instance.managers,
      'club': instance.club,
      'image': instance.image
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

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(json['image']);
}

Map<String, dynamic> _$ImageToJson(Image instance) =>
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

Events _$EventsFromJson(Map<String, dynamic> json) {
  return Events(
      json['id'],
      json['eventDate'],
      json['eventDescription'],
      json['eventFee'],
      json['eventImg'],
      json['eventLimit'],
      json['eventLocation'],
      json['eventName'],
      json['eventTime'],
      json['eventstatus'] == null
          ? null
          : Eventstatus.fromJson(json['eventstatus'] as Map<String, dynamic>),
      json['singedup_count'],
      json['monthName'],
      json['dayOfTheMonth'],
      json['dayName'],
      (json['accepted_users'] as List)
          ?.map((e) => e == null
              ? null
              : AcceptedUsers.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'id': instance.id,
      'eventName': instance.eventName,
      'eventImg': instance.eventImg,
      'eventLocation': instance.eventLocation,
      'eventDate': instance.eventDate,
      'eventTime': instance.eventTime,
      'eventFee': instance.eventFee,
      'eventLimit': instance.eventLimit,
      'eventDescription': instance.eventDescription,
      'eventstatus': instance.eventstatus,
      'singedup_count': instance.singedupCount,
      'dayOfTheMonth': instance.dayOfTheMonth,
      'monthName': instance.monthName,
      'dayName': instance.dayName,
      'accepted_users': instance.acceptedUsers
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

Club _$ClubFromJson(Map<String, dynamic> json) {
  return Club(json['id'], json['clubName'], json['logo'], json['city']);
}

Map<String, dynamic> _$ClubToJson(Club instance) => <String, dynamic>{
      'id': instance.id,
      'clubName': instance.clubName,
      'logo': instance.logo,
      'city': instance.city
    };

Eventstatus _$EventstatusFromJson(Map<String, dynamic> json) {
  return Eventstatus(json['id'], json['status']);
}

Map<String, dynamic> _$EventstatusToJson(Eventstatus instance) =>
    <String, dynamic>{'id': instance.id, 'status': instance.status};

AmericnoInvites _$AmericnoInvitesFromJson(Map<String, dynamic> json) {
  return AmericnoInvites(
      json['id'],
      json['city'],
      json['dayName'],
      json['dayOfTheMonth'],
      json['fee'],
      json['invitation'] == null
          ? null
          : Invitation.fromJson(json['invitation'] as Map<String, dynamic>),
      json['league'] == null
          ? null
          : League.fromJson(json['league'] as Map<String, dynamic>),
      json['monthName'],
      json['numberOfPlayers'],
      json['singedup_count'],
      json['status'],
      json['tournamentName'],
      json['tournamentType'],
      json['startingTime']);
}

Map<String, dynamic> _$AmericnoInvitesToJson(AmericnoInvites instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournamentType': instance.tournamentType,
      'tournamentName': instance.tournamentName,
      'fee': instance.fee,
      'city': instance.city,
      'numberOfPlayers': instance.numberOfPlayers,
      'singedup_count': instance.singedupCount,
      'status': instance.status,
      'monthName': instance.monthName,
      'startingTime': instance.startingTime,
      'dayOfTheMonth': instance.dayOfTheMonth,
      'dayName': instance.dayName,
      'invitation': instance.invitation,
      'league': instance.league
    };

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return Invitation(
      json['id'], json['status'], json['tournament_id'], json['user_id']);
}

Map<String, dynamic> _$InvitationToJson(Invitation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournament_id': instance.tournamentId,
      'user_id': instance.userId,
      'status': instance.status
    };

League _$LeagueFromJson(Map<String, dynamic> json) {
  return League(
      json['id'],
      json['city'],
      json['club_id'],
      json['competitionType'],
      json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      json['leagueDesc'],
      json['leagueName'],
      json['nextUrl'],
      json['sportType'],
      json['status']);
}

Map<String, dynamic> _$LeagueToJson(League instance) => <String, dynamic>{
      'id': instance.id,
      'nextUrl': instance.nextUrl,
      'leagueName': instance.leagueName,
      'city': instance.city,
      'leagueDesc': instance.leagueDesc,
      'competitionType': instance.competitionType,
      'club_id': instance.clubId,
      'sportType': instance.sportType,
      'status': instance.status,
      'image': instance.image
    };
