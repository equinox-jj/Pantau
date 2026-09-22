import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';

@freezed
abstract class Register with _$Register {
  factory Register({bool? status, String? message, RegisterData? data}) =
      _Register;
}

@freezed
abstract class RegisterData with _$RegisterData {
  const factory RegisterData({
    String? token,
    int? expiresIn,
    RegisterUser? user,
  }) = _RegisterData;
}

@freezed
abstract class RegisterUser with _$RegisterUser {
  const factory RegisterUser({
    String? uuid,
    String? email,
    String? username,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RegisterUser;
}
