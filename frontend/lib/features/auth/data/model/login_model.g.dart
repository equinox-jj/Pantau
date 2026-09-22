// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => _LoginModel(
  status: json['status'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : LoginDataModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginModelToJson(_LoginModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

_LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) =>
    _LoginDataModel(
      token: json['token'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      userResponse: json['user_response'] == null
          ? null
          : LoginUserModel.fromJson(
              json['user_response'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$LoginDataModelToJson(_LoginDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expires_in': instance.expiresIn,
      'user_response': instance.userResponse,
    };

_LoginUserModel _$LoginUserModelFromJson(Map<String, dynamic> json) =>
    _LoginUserModel(
      uuid: json['uuid'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      role: json['role'] as String?,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$LoginUserModelToJson(_LoginUserModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'email': instance.email,
      'username': instance.username,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
