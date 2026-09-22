// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    _RegisterModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : RegisterDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterModelToJson(_RegisterModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_RegisterDataModel _$RegisterDataModelFromJson(Map<String, dynamic> json) =>
    _RegisterDataModel(
      token: json['token'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      userResponse: json['user_response'] == null
          ? null
          : RegisterUserModel.fromJson(
              json['user_response'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RegisterDataModelToJson(_RegisterDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires_in': instance.expiresIn,
      'user_response': instance.userResponse,
    };

_RegisterUserModel _$RegisterUserModelFromJson(Map<String, dynamic> json) =>
    _RegisterUserModel(
      uuid: json['uuid'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      role: json['role'] as String?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$RegisterUserModelToJson(_RegisterUserModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'email': instance.email,
      'username': instance.username,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
