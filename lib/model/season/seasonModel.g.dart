// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seasonModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) {
  return SeasonModel((json['tr'] as List)
      ?.map((e) => e == null ? null : Tr.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$SeasonModelToJson(SeasonModel instance) =>
    <String, dynamic>{'tr': instance.tr};

Tr _$TrFromJson(Map<String, dynamic> json) {
  return Tr(json['id'], json['tournamentName'], json['fee'], json['status'],
      json['tournamentType'], json['ended'], json['started']);
}

Map<String, dynamic> _$TrToJson(Tr instance) => <String, dynamic>{
      'id': instance.id,
      'tournamentName': instance.tournamentName,
      'tournamentType': instance.tournamentType,
      'fee': instance.fee,
      'status': instance.status,
      'started': instance.started,
      'ended': instance.ended
    };
