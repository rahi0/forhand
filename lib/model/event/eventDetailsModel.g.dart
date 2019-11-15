// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDetailsModel _$EventDetailsModelFromJson(Map<String, dynamic> json) {
  return EventDetailsModel(
      json['success'] as bool,
      json['event'] == null
          ? null
          : Event.fromJson(json['event'] as Map<String, dynamic>));
}

Map<String, dynamic> _$EventDetailsModelToJson(EventDetailsModel instance) =>
    <String, dynamic>{'success': instance.success, 'event': instance.event};

Event _$EventFromJson(Map<String, dynamic> json) {
  return Event(
      json['id'],
      json['eventTime'],
      json['eventName'],
      json['eventLocation'],
      json['eventLimit'],
      json['eventImg'],
      json['eventFee'],
      json['eventDescription'],
      json['eventDate'],
      json['singedup_count'],
      (json['accepted_users'] as List)
          ?.map((e) => e == null
              ? null
              : AcceptedUsers.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['eventstatus'] == null
          ? null
          : Eventstatus.fromJson(json['eventstatus'] as Map<String, dynamic>),
      json['dayName'],
      json['dayOfTheMonth'],
      json['monthName']);
}

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'eventName': instance.eventName,
      'eventImg': instance.eventImg,
      'eventLocation': instance.eventLocation,
      'eventDate': instance.eventDate,
      'eventTime': instance.eventTime,
      'eventFee': instance.eventFee,
      'eventLimit': instance.eventLimit,
      'eventDescription': instance.eventDescription,
      'singedup_count': instance.singedupCount,
      'accepted_users': instance.acceptedUsers,
      'eventstatus': instance.eventstatus,
      'dayOfTheMonth': instance.dayOfTheMonth,
      'monthName': instance.monthName,
      'dayName': instance.dayName
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

Eventstatus _$EventstatusFromJson(Map<String, dynamic> json) {
  return Eventstatus(json['id'], json['status']);
}

Map<String, dynamic> _$EventstatusToJson(Eventstatus instance) =>
    <String, dynamic>{'id': instance.id, 'status': instance.status};
