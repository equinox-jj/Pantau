import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants/constants.dart';

class LocalPref {
  const LocalPref(this._prefs);

  final SharedPreferences _prefs;

  Future<void> setOnboardingSeen(bool isSeen) =>
      _prefs.setBool(PrefKey.isOnboardingSeen, isSeen);

  bool hasOnboardingSeen() => _prefs.getBool(PrefKey.isOnboardingSeen) ?? false;
}
