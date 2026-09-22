import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/di/di.dart';
import 'package:pantau/features/auth/domain/usecase/usecase.dart';
import 'package:pantau/features/profile/presentation/pages/profile/provider/provider.dart';
import 'package:pantau/features/report/di/di.dart';
import 'package:pantau/features/report/domain/usecase/usecase.dart';
import 'package:pantau/features/report/presentation/pages/feed/provider/provider.dart';

class MockLogoutUsecase extends Mock implements LogoutUsecase {}

class MockGetMyReportsUsecase extends Mock implements GetMyReportsUsecase {}

class MockGetCurrentUserUsecase extends Mock implements GetCurrentUserUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(const NoParams());
    registerFallbackValue(const GetMyReportsParams());
  });

  late MockLogoutUsecase logoutUsecase;
  late MockGetMyReportsUsecase myReportsUsecase;
  late MockGetCurrentUserUsecase currentUserUsecase;
  late ProviderContainer container;

  setUp(() {
    logoutUsecase = MockLogoutUsecase();
    myReportsUsecase = MockGetMyReportsUsecase();
    currentUserUsecase = MockGetCurrentUserUsecase();
    container = ProviderContainer(
      overrides: [
        logoutUsecaseProvider.overrideWithValue(logoutUsecase),
        getMyReportsUsecaseProvider.overrideWithValue(myReportsUsecase),
        getCurrentUserUsecaseProvider.overrideWithValue(currentUserUsecase),
      ],
    );
    addTearDown(container.dispose);
  });

  test('initial state is AsyncData(false)', () {
    expect(container.read(logoutProvider), const AsyncData<bool>(false));
  });

  test(
    'successful logout transitions state to loading then AsyncData(true)',
    () async {
      when(() => logoutUsecase(any()))
          .thenAnswer((_) async => const Right(null));

      final states = <AsyncValue<bool>>[];
      container.listen(logoutProvider, (previous, next) => states.add(next));

      final future = container.read(logoutProvider.notifier).logout();

      // The state flips to loading synchronously, before the usecase's
      // future ever resolves.
      expect(container.read(logoutProvider), isA<AsyncLoading<bool>>());

      await future;

      expect(container.read(logoutProvider), const AsyncData<bool>(true));
      expect(states, [isA<AsyncLoading<bool>>(), const AsyncData<bool>(true)]);
    },
  );

  test('failed logout transitions state to loading then AsyncError carrying the Failure', () async {
    const failure = Failure.server(500, 'boom');
    when(() => logoutUsecase(any()))
        .thenAnswer((_) async => const Left(failure));

    final states = <AsyncValue<bool>>[];
    container.listen(logoutProvider, (previous, next) => states.add(next));

    await container.read(logoutProvider.notifier).logout();

    final state = container.read(logoutProvider);
    expect(state.hasError, isTrue);
    expect(state.error, failure);
    expect(states.first, isA<AsyncLoading<bool>>());
    expect(states.last.hasError, isTrue);
  });

  test(
    'successful logout invalidates myReportsProvider and currentUserProvider',
    () async {
      when(() => logoutUsecase(any()))
          .thenAnswer((_) async => const Right(null));
      when(() => myReportsUsecase(any()))
          .thenAnswer((_) async => const Right([]));
      when(() => currentUserUsecase(any()))
          .thenAnswer((_) async => const Right(null));

      // Keep both providers alive with an active listener so an invalidation
      // triggers an eager rebuild instead of merely being marked dirty.
      container.listen(myReportsProvider, (_, _) {});
      container.listen(currentUserProvider, (_, _) {});
      await pumpEventQueue();

      verify(() => myReportsUsecase(any())).called(1);
      verify(() => currentUserUsecase(any())).called(1);

      clearInteractions(myReportsUsecase);
      clearInteractions(currentUserUsecase);

      await container.read(logoutProvider.notifier).logout();
      await pumpEventQueue();

      verify(() => myReportsUsecase(any())).called(1);
      verify(() => currentUserUsecase(any())).called(1);
    },
  );
}
