import 'package:json_annotation/json_annotation.dart';
part 'eventDetailsModel.g.dart';

@JsonSerializable()
class EventDetailsModel {
  bool success;
  final Event event;
  
  EventDetailsModel(this.success, this.event);
  factory EventDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$EventDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventDetailsModelToJson(this);
}
@JsonSerializable()
class Event {
  dynamic id;
  dynamic eventName;
  dynamic eventImg;
  dynamic eventLocation;
  dynamic eventDate;
  dynamic eventTime;
  dynamic eventFee;
  dynamic eventLimit;
  dynamic eventDescription;
  @JsonKey(name: "singedup_count")
  dynamic singedupCount;

  @JsonKey(name: "accepted_users")
  final List<AcceptedUsers> acceptedUsers;
  Eventstatus eventstatus;

  dynamic dayOfTheMonth;
  dynamic monthName;
  dynamic dayName;

  Event(this.id, this.eventTime, this.eventName, this.eventLocation, this.eventLimit,
      this.eventImg, this.eventFee, this.eventDescription, this.eventDate, this.singedupCount, this.acceptedUsers, this.eventstatus, 
      this.dayName, this.dayOfTheMonth, this.monthName);
  factory Event.fromJson(Map<String, dynamic> json) =>
      _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
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
class User {
  dynamic id;
  dynamic firstName;
  dynamic lastName;
  dynamic profilePic;


  User(this.id, this.firstName, this.lastName, this.profilePic);
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Eventstatus{
   dynamic id; 
   dynamic status;
  Eventstatus(this.id, this.status);

  factory Eventstatus.fromJson(Map<String, dynamic> json) => _$EventstatusFromJson(json);
  Map<String, dynamic> toJson() => _$EventstatusToJson(this);
   
}
