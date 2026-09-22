import '../../domain/entity/entity.dart';
import '../model/model.dart';

extension LoginModelMapper on LoginModel {
  Login toEntity() {
    return Login(status: status, message: message, data: data?.toEntity());
  }
}

extension LoginDataModelMapper on LoginDataModel {
  LoginData toEntity() {
    return LoginData(
      token: token,
      expiresIn: expiresIn,
      user: userResponse?.toEntity(),
    );
  }
}

extension LoginUserModelMapper on LoginUserModel {
  LoginUser toEntity() {
    return LoginUser(
      uuid: uuid,
      email: email,
      username: username,
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
