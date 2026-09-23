import 'package:freezed_annotation/freezed_annotation.dart';

part 'register.freezed.dart';

@freezed
abstract class Register with _$Register {
  const factory Register({String? token, int? expiresIn, RegisterUser? user}) =
      _Register;
}

@freezed
abstract class RegisterUser with _$RegisterUser {
  const factory RegisterUser({
    String? uuid,
    String? email,
    String? displayName,
    String? role,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _RegisterUser;
}
