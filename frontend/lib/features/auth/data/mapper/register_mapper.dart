import '../../domain/entity/entity.dart';
import '../model/model.dart';

extension RegisterModelMapper on RegisterModel {
  Register toEntity() {
    return Register(
      token: token,
      expiresIn: expiresIn,
      user: userResponse?.toEntity(),
    );
  }
}

extension RegisterUserModelMapper on RegisterUserModel {
  RegisterUser toEntity() {
    return RegisterUser(
      uuid: id,
      email: email,
      displayName: displayName,
      role: role,
      createdAt: _parseDate(createdAt),
      updatedAt: _parseDate(updatedAt),
    );
  }
}

DateTime? _parseDate(dynamic value) {
  if (value == null) return null;
  if (value is DateTime) return value;
  if (value is String) {
    return DateTime.tryParse(value);
  }

  return null;
}
