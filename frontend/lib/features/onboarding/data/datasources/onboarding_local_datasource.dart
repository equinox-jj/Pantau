import '../../../../core/base/base.dart';
import '../../../../core/local_storage/local_storage.dart';

abstract class OnboardingLocalDataSource with BaseLocalDataSource {
  Future<bool> hasSeenOnboarding();
  Future<void> setOnboardingSeen();
}

class OnboardingLocalDataSourceImpl extends OnboardingLocalDataSource {
  OnboardingLocalDataSourceImpl({required this._prefs});

  final LocalPref _prefs;

  @override
  Future<bool> hasSeenOnboarding() =>
      safeCacheCall(() async => _prefs.hasOnboardingSeen());

  @override
  Future<void> setOnboardingSeen() => safeCacheCall(() async {
    await _prefs.setOnboardingSeen(true);
  });
}
