import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';

@freezed
abstract class Login with _$Login {
  const factory Login({bool? status, String? message, LoginData? data}) =
      _Login;
}

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData({String? token, int? expiresIn, LoginUser? user}) =
      _LoginData;
}

@freezed
abstract class LoginUser with _$LoginUser {
  const factory LoginUser({
    String? uuid,
    String? email,
    String? username,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _LoginUser;
}
