// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventUserLists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventUserLists _$EventUserListsFromJson(Map<String, dynamic> json) {
  return EventUserLists((json['users'] as List)
      ?.map((e) => e == null ? null : Users.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$EventUserListsToJson(EventUserLists instance) =>
    <String, dynamic>{'users': instance.users};

Users _$UsersFromJson(Map<String, dynamic> json) {
  return Users(
      json['firstName'], json['id'], json['lastName'], json['profilePic']);
}

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePic': instance.profilePic,
      'id': instance.id
    };
