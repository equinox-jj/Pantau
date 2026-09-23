import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
abstract class LoginModel with _$LoginModel {
  const factory LoginModel({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "expires_in") int? expiresIn,
    @JsonKey(name: "user_response") LoginUserModel? userResponse,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}

@freezed
abstract class LoginUserModel with _$LoginUserModel {
  const factory LoginUserModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "display_name") String? displayName,
    @JsonKey(name: "role") String? role,
    @JsonKey(name: "created_at") dynamic createdAt,
    @JsonKey(name: "updated_at") dynamic updatedAt,
  }) = _LoginUserModel;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) =>
      _$LoginUserModelFromJson(json);
}
