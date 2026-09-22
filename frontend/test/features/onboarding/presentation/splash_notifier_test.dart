import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/local_storage/local_storage.dart';
import 'package:pantau/core/router/app_routes.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/auth/di/di.dart';
import 'package:pantau/features/auth/domain/usecase/get_cached_role_usecase.dart';
import 'package:pantau/features/onboarding/di/di.dart';
import 'package:pantau/features/onboarding/domain/usecase/usecase.dart';
import 'package:pantau/features/onboarding/presentation/pages/splash/provider/provider.dart';

class MockGetOnboardingSeenUsecase extends Mock
    implements GetOnboardingSeenUsecase {}

class MockTokenStorage extends Mock implements TokenStorage {}

class MockGetCachedRoleUsecase extends Mock implements GetCachedRoleUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(const NoParams());
  });

  late MockGetOnboardingSeenUsecase onboardingUsecase;
  late MockTokenStorage tokenStorage;
  late MockGetCachedRoleUsecase roleUsecase;
  late ProviderContainer container;

  setUp(() {
    onboardingUsecase = MockGetOnboardingSeenUsecase();
    tokenStorage = MockTokenStorage();
    roleUsecase = MockGetCachedRoleUsecase();
    container = ProviderContainer(
      overrides: [
        getOnboardingSeenUsecaseProvider.overrideWithValue(onboardingUsecase),
        tokenStorageProvider.overrideWithValue(tokenStorage),
        getCachedRoleUsecaseProvider.overrideWithValue(roleUsecase),
      ],
    );
    addTearDown(container.dispose);
  });

  // splashProvider is autoDispose; without a live listener the provider can
  // be torn down mid-build (once `ref.read` inside `build()` runs after an
  // await), so pin it right before triggering the build in every test.
  Future<String> buildSplash() {
    container.listen(splashProvider, (_, _) {});
    return container.read(splashProvider.future);
  }

  test(
    'routes to login when no token is stored but onboarding was seen',
    () async {
      when(() => tokenStorage.readAccessToken()).thenAnswer((_) async => null);
      when(() => onboardingUsecase(any()))
          .thenAnswer((_) async => const Right(true));

      final route = await buildSplash();

      expect(route, AppRoutes.login);
      verifyNever(() => roleUsecase(any()));
    },
  );

  test(
    'routes to onboarding when the stored token is an empty string',
    () async {
      when(() => tokenStorage.readAccessToken()).thenAnswer((_) async => '');
      when(() => onboardingUsecase(any()))
          .thenAnswer((_) async => const Right(false));

      final route = await buildSplash();

      expect(route, AppRoutes.onboarding);
    },
  );

  test(
    'routes to onboarding when no token is stored and onboarding was not seen',
    () async {
      when(() => tokenStorage.readAccessToken()).thenAnswer((_) async => null);
      when(() => onboardingUsecase(any()))
          .thenAnswer((_) async => const Right(false));

      final route = await buildSplash();

      expect(route, AppRoutes.onboarding);
    },
  );

  test('routes to onboarding when no token is stored and the onboarding usecase fails', () async {
    when(() => tokenStorage.readAccessToken()).thenAnswer((_) async => null);
    when(() => onboardingUsecase(any()))
        .thenAnswer((_) async => const Left(Failure.cache()));

    final route = await buildSplash();

    expect(route, AppRoutes.onboarding);
  });

  test('routes to the resolver dashboard when a token exists and the cached role is resolver', () async {
    when(() => tokenStorage.readAccessToken()).thenAnswer((_) async => 'token');
    when(() => onboardingUsecase(any()))
        .thenAnswer((_) async => const Right(true));
    when(() => roleUsecase(any()))
        .thenAnswer((_) async => const Right(UserRole.resolver));

    final route = await buildSplash();

    expect(route, AppRoutes.resolverDashboard);
  });

  test('routes to the citizen dashboard when a token exists and the cached role is user', () async {
    when(() => tokenStorage.readAccessToken()).thenAnswer((_) async => 'token');
    when(() => onboardingUsecase(any()))
        .thenAnswer((_) async => const Right(true));
    when(() => roleUsecase(any()))
        .thenAnswer((_) async => const Right(UserRole.user));

    final route = await buildSplash();

    expect(route, AppRoutes.dashboard);
  });

  test('routes to the citizen dashboard when a token exists but the role lookup fails', () async {
    when(() => tokenStorage.readAccessToken()).thenAnswer((_) async => 'token');
    when(() => onboardingUsecase(any()))
        .thenAnswer((_) async => const Right(true));
    when(() => roleUsecase(any()))
        .thenAnswer((_) async => const Left(Failure.unauthorized()));

    final route = await buildSplash();

    expect(route, AppRoutes.dashboard);
  });
}
