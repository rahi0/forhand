import 'package:json_annotation/json_annotation.dart';
part 'eventUserLists.g.dart';
@JsonSerializable()
class EventUserLists{
  List<Users> users; 
  EventUserLists(this.users);
  factory EventUserLists.fromJson(Map<String, dynamic> json) =>
      _$EventUserListsFromJson(json);
  Map<String, dynamic> toJson() => _$EventUserListsToJson(this);
}

@JsonSerializable()
class Users{
   dynamic firstName;
   dynamic lastName;
   dynamic profilePic;
   dynamic id;
   Users(this.firstName, this.id, this.lastName, this.profilePic);
   factory Users.fromJson(Map<String, dynamic> json) =>
      _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}