// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      id: json['id'] as String?,
      displayName: json['display_name'] as String?,
      joinedAt: json['joined_at'],
      reportsCount: (json['reports_count'] as num?)?.toInt(),
      resolvedCount: (json['resolved_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'joined_at': instance.joinedAt,
      'reports_count': instance.reportsCount,
      'resolved_count': instance.resolvedCount,
    };
