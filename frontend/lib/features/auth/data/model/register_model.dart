import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
abstract class RegisterModel with _$RegisterModel {
  factory RegisterModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") RegisterDataModel? data,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}

@freezed
abstract class RegisterDataModel with _$RegisterDataModel {
  const factory RegisterDataModel({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "expires_in") int? expiresIn,
    @JsonKey(name: "user_response") RegisterUserModel? userResponse,
  }) = _RegisterDataModel;

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataModelFromJson(json);
}

@freezed
abstract class RegisterUserModel with _$RegisterUserModel {
  const factory RegisterUserModel({
    @JsonKey(name: "uuid") String? uuid,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "created_at") dynamic createdAt,
    @JsonKey(name: "updated_at") dynamic updatedAt,
  }) = _RegisterUserModel;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserModelFromJson(json);
}
