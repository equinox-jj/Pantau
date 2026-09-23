// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatusHistoryEntryModel _$StatusHistoryEntryModelFromJson(
  Map<String, dynamic> json,
) => _StatusHistoryEntryModel(
  id: json['id'] as String?,
  fromStatus: json['from_status'] as String?,
  toStatus: json['to_status'] as String?,
  note: json['note'] as String?,
  actorRole: json['actor_role'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$StatusHistoryEntryModelToJson(
  _StatusHistoryEntryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'from_status': instance.fromStatus,
  'to_status': instance.toStatus,
  'note': instance.note,
  'actor_role': instance.actorRole,
  'created_at': instance.createdAt,
};
