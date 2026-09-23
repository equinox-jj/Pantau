// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    _RegisterModel(
      token: json['token'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      userResponse: json['user_response'] == null
          ? null
          : RegisterUserModel.fromJson(
              json['user_response'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RegisterModelToJson(_RegisterModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires_in': instance.expiresIn,
      'user_response': instance.userResponse,
    };

_RegisterUserModel _$RegisterUserModelFromJson(Map<String, dynamic> json) =>
    _RegisterUserModel(
      id: json['id'] as String?,
      email: json['email'] as String?,
      displayName: json['display_name'] as String?,
      role: json['role'] as String?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$RegisterUserModelToJson(_RegisterUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'display_name': instance.displayName,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
