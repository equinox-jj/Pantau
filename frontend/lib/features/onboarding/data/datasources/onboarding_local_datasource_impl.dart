import 'package:pantau/core/local_storage/local_storage.dart';
import 'package:pantau/features/onboarding/data/datasources/onboarding_local_datasource.dart';

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
