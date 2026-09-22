import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/di/di.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/auth/domain/usecase/usecase.dart';
import 'package:pantau/features/auth/presentation/pages/register/provider/register_notifier.dart';

class MockRegisterUsecase extends Mock implements RegisterUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      const RegisterParams(displayName: '', email: '', password: ''),
    );
  });

  late MockRegisterUsecase usecase;
  late ProviderContainer container;

  setUp(() {
    usecase = MockRegisterUsecase();
    container = ProviderContainer(
      overrides: [registerUsecaseProvider.overrideWithValue(usecase)],
    );
    addTearDown(container.dispose);
  });

  test('initial state is AsyncData(null)', () {
    final state = container.read(registerUserProvider);
    expect(state, const AsyncData<Register?>(null));
  });

  test(
    'register() success updates state to AsyncData with the returned entity',
    () async {
      final register = Register(status: true, message: 'created');
      when(() => usecase(any())).thenAnswer((_) async => Right(register));

      await container
          .read(registerUserProvider.notifier)
          .register(email: 'a@b.com', password: 'secret', displayName: 'Alice');

      expect(
        container.read(registerUserProvider),
        AsyncData<Register?>(register),
      );
    },
  );

  test(
    'register() failure updates state to AsyncError carrying the Failure',
    () async {
      when(() => usecase(any())).thenAnswer(
        (_) async => const Left(
          Failure.validation({
            'email': ['taken'],
          }),
        ),
      );

      await container
          .read(registerUserProvider.notifier)
          .register(email: 'a@b.com', password: 'secret', displayName: 'Alice');

      final state = container.read(registerUserProvider);
      expect(state.hasError, isTrue);
      expect(
        state.error,
        const Failure.validation({
          'email': ['taken'],
        }),
      );
    },
  );

  test('register() passes the given fields to the usecase', () async {
    when(() => usecase(any())).thenAnswer((_) async => Right(Register()));

    await container
        .read(registerUserProvider.notifier)
        .register(email: 'a@b.com', password: 'secret', displayName: 'Alice');

    verify(
      () => usecase(
        const RegisterParams(
          displayName: 'Alice',
          email: 'a@b.com',
          password: 'secret',
        ),
      ),
    ).called(1);
  });
}
