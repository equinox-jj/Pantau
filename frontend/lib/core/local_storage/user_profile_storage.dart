import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Caches the signed-in user's profile fields locally. Unlike [TokenStorage]
/// this is not secret data, so it lives in `SharedPreferences` rather than
/// Keychain/Keystore — the same tier `LocalPref` already uses.
abstract interface class UserProfileStorage {
  /// The cached user as a raw JSON map, or `null` if nothing is cached
  /// (never logged in, or cleared on sign-out).
  Future<Map<String, dynamic>?> read();

  Future<void> save(Map<String, dynamic> user);

  Future<void> clear();
}

class LocalUserProfileStorage implements UserProfileStorage {
  const LocalUserProfileStorage(this._prefs);

  final SharedPreferences _prefs;

  static const _kUser = 'current_user';

  @override
  Future<Map<String, dynamic>?> read() async {
    final raw = _prefs.getString(_kUser);
    if (raw == null) return null;

    return jsonDecode(raw) as Map<String, dynamic>;
  }

  @override
  Future<void> save(Map<String, dynamic> user) =>
      _prefs.setString(_kUser, jsonEncode(user));

  @override
  Future<void> clear() async => _prefs.remove(_kUser);
}
