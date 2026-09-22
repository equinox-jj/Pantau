import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Persists access/refresh tokens. Domain code depends on this abstraction.
abstract interface class TokenStorage {
  Future<String?> readAccessToken();

  Future<void> saveTokens({required String accessToken});

  Future<void> clear();
}

/// [TokenStorage] backed by [FlutterSecureStorage] — Keychain on iOS,
/// EncryptedSharedPreferences/Keystore on Android.
class SecureTokenStorageImpl implements TokenStorage {
  const SecureTokenStorageImpl(this._storage);

  final FlutterSecureStorage _storage;

  static const _kAccess = 'access_token';

  @override
  Future<String?> readAccessToken() => _storage.read(key: _kAccess);

  @override
  Future<void> saveTokens({required String accessToken}) async =>
      await Future.wait([_storage.write(key: _kAccess, value: accessToken)]);

  @override
  Future<void> clear() => _storage.deleteAll();
}
