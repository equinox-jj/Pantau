import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.freezed.dart';
part 'register_model.g.dart';

@freezed
abstract class RegisterModel with _$RegisterModel {
  const factory RegisterModel({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "expires_in") int? expiresIn,
    @JsonKey(name: "user_response") RegisterUserModel? userResponse,
  }) = _RegisterModel;

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
}

@freezed
abstract class RegisterUserModel with _$RegisterUserModel {
  const factory RegisterUserModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "display_name") String? displayName,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "created_at") dynamic createdAt,
    @JsonKey(name: "updated_at") dynamic updatedAt,
  }) = _RegisterUserModel;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserModelFromJson(json);
}
