import 'package:json_annotation/json_annotation.dart';
part 'tournamentAndEvent.g.dart';

@JsonSerializable()
class TournamentAndEvent {
  final List<RunningLeagues> runningTr;
  final List<CompletedLeagues> completedTr;
  final List<Events> events;
  final List<AmericnoInvites> americnoInvites;

  TournamentAndEvent(this.completedTr, this.events, this.runningTr, this.americnoInvites);

  factory TournamentAndEvent.fromJson(Map<String, dynamic> json) =>
      _$TournamentAndEventFromJson(json);
  Map<String, dynamic> toJson() => _$TournamentAndEventToJson(this);
}





@JsonSerializable()
class RunningLeagues {
  final dynamic id;
  final dynamic leagueName;
  final dynamic competitionType;
  final dynamic sportType;
  final List<Managers> managers;
  final Club club;
  final Image image;

  RunningLeagues(this.id, this.leagueName, this.managers, this.sportType, this.competitionType, this.club, this.image);

  factory RunningLeagues.fromJson(Map<String, dynamic> json) => _$RunningLeaguesFromJson(json);
  Map<String, dynamic> toJson() => _$RunningLeaguesToJson(this);
}
@JsonSerializable()
class CompletedLeagues {
  final dynamic id;
  final dynamic leagueName;
  final dynamic competitionType;
  final dynamic sportType;
  final List<Managers> managers;
  final Club club;
  final Image image;
  CompletedLeagues(this.id, this.leagueName, this.managers, this.sportType, this.competitionType, this.club, this.image);

  factory CompletedLeagues.fromJson(Map<String, dynamic> json) => _$CompletedLeaguesFromJson(json);
  Map<String, dynamic> toJson() => _$CompletedLeaguesToJson(this);
}


@JsonSerializable()
class Managers {
  final dynamic id;
  final User user;

  Managers(this.id, this.user);

  factory Managers.fromJson(Map<String, dynamic> json) =>
      _$ManagersFromJson(json);
  Map<String, dynamic> toJson() => _$ManagersToJson(this);
}
@JsonSerializable()
class Image {
  final dynamic image;
  Image(this.image);
  factory Image.fromJson(Map<String, dynamic> json) =>
      _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);
}


@JsonSerializable()
class User {
  final dynamic id;
  final dynamic profilePic;
  final dynamic firstName;
  final dynamic lastName;
  final dynamic phone;
  final dynamic email;

  User(this.id, this.profilePic, this.firstName, this.lastName, this.phone,
      this.email);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}





@JsonSerializable()
class Events {
  final dynamic id;
  final dynamic eventName;
  final dynamic eventImg;
  final dynamic eventLocation;
  final dynamic eventDate;
  final dynamic eventTime;
  final dynamic eventFee;
  final dynamic eventLimit;
  final dynamic eventDescription;
  Eventstatus eventstatus;
  @JsonKey(name: "singedup_count")
  dynamic singedupCount;
  dynamic dayOfTheMonth;
  dynamic monthName;
  dynamic dayName;

  @JsonKey(name: "accepted_users")
  final List<AcceptedUsers> acceptedUsers;

  Events(
      this.id,
      this.eventDate,
      this.eventDescription,
      this.eventFee,
      this.eventImg,
      this.eventLimit,
      this.eventLocation,
      this.eventName,
      this.eventTime, this.eventstatus, this.singedupCount, this.monthName, this.dayOfTheMonth, this.dayName, this.acceptedUsers
      );

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);
  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
@JsonSerializable()
class AcceptedUsers {
  dynamic id;
  dynamic event_id;
  dynamic user_id;
  dynamic status;
  final User user;


  AcceptedUsers(this.id, this.event_id, this.user_id, this.status, this.user  );
  factory AcceptedUsers.fromJson(Map<String, dynamic> json) =>
      _$AcceptedUsersFromJson(json);
  Map<String, dynamic> toJson() => _$AcceptedUsersToJson(this);
}




@JsonSerializable()
class Club{
    final dynamic id;
    final dynamic clubName;
    final dynamic logo;
    final dynamic city;

    Club(this.id, this.clubName, this.logo, this.city);

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);
  Map<String, dynamic> toJson() => _$ClubToJson(this);
}
@JsonSerializable()
class Eventstatus{
   dynamic id; 
   dynamic status;
    Eventstatus(this.id, this.status);

  factory Eventstatus.fromJson(Map<String, dynamic> json) => _$EventstatusFromJson(json);
  Map<String, dynamic> toJson() => _$EventstatusToJson(this);
   
}


@JsonSerializable()
class AmericnoInvites {
  final dynamic id;
  final dynamic tournamentType;
  final dynamic tournamentName;
  final dynamic fee;
  final dynamic city;
  final dynamic numberOfPlayers;
  @JsonKey(name: "singedup_count")
    dynamic singedupCount;
  final dynamic status;
  final dynamic monthName;
  final dynamic startingTime;
  final dynamic dayOfTheMonth;
  final dynamic dayName;
  final Invitation invitation;
  final League league;


  AmericnoInvites(this.id, this.city, this.dayName, this.dayOfTheMonth, this.fee, this.invitation, this.league,
                   this.monthName, this.numberOfPlayers, this.singedupCount, this.status, this.tournamentName, this.tournamentType, this.startingTime);

  factory AmericnoInvites.fromJson(Map<String, dynamic> json) => _$AmericnoInvitesFromJson(json);
  Map<String, dynamic> toJson() => _$AmericnoInvitesToJson(this);
}



@JsonSerializable()
class Invitation{
   dynamic id; 
   @JsonKey(name: "tournament_id")
    dynamic tournamentId;
    @JsonKey(name: "user_id")
    dynamic userId;
   dynamic status;
    Invitation(this.id, this.status, this.tournamentId, this.userId);

  factory Invitation.fromJson(Map<String, dynamic> json) => _$InvitationFromJson(json);
  Map<String, dynamic> toJson() => _$InvitationToJson(this);
   
}



@JsonSerializable()
class League {
  final dynamic id;
  final dynamic nextUrl;
  final dynamic leagueName;
  final dynamic city;
  final dynamic leagueDesc;
  final dynamic competitionType;
  @JsonKey(name: "club_id")
    dynamic clubId;
  final dynamic sportType;
  final dynamic status;
  final Image image;


  League(this.id, this.city, this.clubId, this.competitionType, this.image, this.leagueDesc,
        this.leagueName, this.nextUrl, this.sportType, this.status);

  factory League.fromJson(Map<String, dynamic> json) => _$LeagueFromJson(json);
  Map<String, dynamic> toJson() => _$LeagueToJson(this);
}