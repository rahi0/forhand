import 'package:json_annotation/json_annotation.dart';
part 'seasonModel.g.dart';
@JsonSerializable()
class SeasonModel {
  final List<Tr> tr;
  
  SeasonModel(this.tr);
  factory SeasonModel.fromJson(Map<String, dynamic> json) =>
      _$SeasonModelFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonModelToJson(this);

}
@JsonSerializable()
class Tr {
  dynamic id;
  dynamic tournamentName;
  dynamic tournamentType;
  dynamic fee;
  dynamic status;
  dynamic started;
  dynamic ended;
 
  Tr(this.id, this.tournamentName, this.fee, this.status, this.tournamentType, this.ended, this.started);
  factory Tr.fromJson(Map<String, dynamic> json) =>
      _$TrFromJson(json);
  Map<String, dynamic> toJson() => _$TrToJson(this);
}
