// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UserProfileDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_UserProfileDataModel _$UserProfileDataModelFromJson(
  Map<String, dynamic> json,
) => _UserProfileDataModel(
  id: json['id'] as String?,
  displayName: json['display_name'] as String?,
  joinedAt: json['joined_at'],
  reportsCount: (json['reports_count'] as num?)?.toInt(),
  resolvedCount: (json['resolved_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$UserProfileDataModelToJson(
  _UserProfileDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'display_name': instance.displayName,
  'joined_at': instance.joinedAt,
  'reports_count': instance.reportsCount,
  'resolved_count': instance.resolvedCount,
};
