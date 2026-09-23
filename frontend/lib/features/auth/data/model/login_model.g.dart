// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => _LoginModel(
  token: json['token'] as String?,
  expiresIn: (json['expires_in'] as num?)?.toInt(),
  userResponse: json['user_response'] == null
      ? null
      : LoginUserModel.fromJson(json['user_response'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginModelToJson(_LoginModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires_in': instance.expiresIn,
      'user_response': instance.userResponse,
    };

_LoginUserModel _$LoginUserModelFromJson(Map<String, dynamic> json) =>
    _LoginUserModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      displayName: json['display_name'] as String?,
      role: json['role'] as String?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$LoginUserModelToJson(_LoginUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'display_name': instance.displayName,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
