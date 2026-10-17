import 'package:pantau/core/base/base.dart';

abstract class OnboardingLocalDataSource with BaseLocalDataSource {
  Future<bool> hasSeenOnboarding();
  Future<void> setOnboardingSeen();
}
