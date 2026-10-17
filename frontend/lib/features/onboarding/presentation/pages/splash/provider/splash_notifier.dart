import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/core/router/app_routes.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/auth/di/auth_di.dart';
import 'package:pantau/features/onboarding/di/onboarding_di.dart';

part 'splash_notifier.g.dart';

/// Minimum time the splash brand animation stays on screen.
const kSplashMinDuration = Duration(milliseconds: 1600);

@riverpod
class Splash extends _$Splash {
  @override
  Future<String> build() async {
    // Watched up front: dependencies belong before the first await.
    final usecase = ref.watch(getOnboardingSeenUsecaseProvider);
    final tokenStorage = ref.watch(tokenStorageProvider);
    final roleUsecase = ref.watch(getCachedRoleUsecaseProvider);

    final resultFuture = usecase(const NoParams());
    final tokenFuture = tokenStorage.readAccessToken();
    final delay = Future<void>.delayed(kSplashMinDuration);

    final result = await resultFuture;
    final token = await tokenFuture;
    await delay;

    // A stored token means the session survived the restart — skip login and
    // onboarding, which an authenticated user has already passed. Which
    // shell it lands in depends on the cached role.
    if (token != null && token.isNotEmpty) {
      final roleResult = await roleUsecase(const NoParams());
      final role = roleResult.fold((_) => UserRole.unknown, (role) => role);

      return role == UserRole.resolver
          ? AppRoutes.resolverDashboard
          : AppRoutes.dashboard;
    }

    return result.fold(
      (_) => AppRoutes.onboarding,
      (hasSeenOnboarding) =>
          hasSeenOnboarding ? AppRoutes.login : AppRoutes.onboarding,
    );
  }
}
