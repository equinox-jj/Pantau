import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/di/di.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/auth/domain/usecase/usecase.dart';
import 'package:pantau/features/auth/presentation/pages/login/provider/login_notifier.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(const LoginParams(email: '', password: ''));
  });

  late MockLoginUsecase usecase;
  late ProviderContainer container;

  setUp(() {
    usecase = MockLoginUsecase();
    container = ProviderContainer(
      overrides: [loginUsecaseProvider.overrideWithValue(usecase)],
    );
    addTearDown(container.dispose);
  });

  test('initial state is AsyncData(null)', () {
    final state = container.read(loginUserProvider);
    expect(state, const AsyncData<Login?>(null));
  });

  test(
    'login() success updates state to AsyncData with the returned entity',
    () async {
      const login = Login(status: true, message: 'ok');
      when(() => usecase(any())).thenAnswer((_) async => const Right(login));

      await container
          .read(loginUserProvider.notifier)
          .login(email: 'a@b.com', password: 'secret');

      expect(container.read(loginUserProvider), const AsyncData<Login?>(login));
    },
  );

  test(
    'login() failure updates state to AsyncError carrying the Failure',
    () async {
      when(() => usecase(any())).thenAnswer(
        (_) async => const Left(Failure.unauthorized('Invalid credentials')),
      );

      await container
          .read(loginUserProvider.notifier)
          .login(email: 'a@b.com', password: 'wrong');

      final state = container.read(loginUserProvider);
      expect(state.hasError, isTrue);
      expect(state.error, const Failure.unauthorized('Invalid credentials'));
    },
  );

  test('login() passes the given email and password to the usecase', () async {
    when(() => usecase(any())).thenAnswer((_) async => const Right(Login()));

    await container
        .read(loginUserProvider.notifier)
        .login(email: 'a@b.com', password: 'secret');

    verify(
      () => usecase(const LoginParams(email: 'a@b.com', password: 'secret')),
    ).called(1);
  });
}
