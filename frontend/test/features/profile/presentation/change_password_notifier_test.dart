import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/profile/di/di.dart';
import 'package:pantau/features/profile/domain/usecase/usecase.dart';
import 'package:pantau/features/profile/presentation/pages/change_password/provider/provider.dart';

class MockChangePasswordUsecase extends Mock implements ChangePasswordUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      const ChangePasswordParams(currentPassword: '', newPassword: ''),
    );
  });

  late MockChangePasswordUsecase usecase;
  late ProviderContainer container;

  setUp(() {
    usecase = MockChangePasswordUsecase();
    container = ProviderContainer(
      overrides: [changePasswordUsecaseProvider.overrideWithValue(usecase)],
    );
    addTearDown(container.dispose);
  });

  test('initial state is AsyncData(false)', () {
    expect(
      container.read(changePasswordProvider),
      const AsyncData<bool>(false),
    );
  });

  test('submit emits loading then AsyncData(true)', () async {
    when(() => usecase(any())).thenAnswer((_) async => const Right(null));

    final states = <AsyncValue<bool>>[];
    container.listen(changePasswordProvider, (_, next) => states.add(next));

    await container
        .read(changePasswordProvider.notifier)
        .submit(currentPassword: 'oldpass12', newPassword: 'newpass34');

    expect(states, [isA<AsyncLoading<bool>>(), const AsyncData<bool>(true)]);
    verify(
      () => usecase(
        const ChangePasswordParams(
          currentPassword: 'oldpass12',
          newPassword: 'newpass34',
        ),
      ),
    ).called(1);
  });

  test('changePassword surfaces failure as AsyncError', () async {
    const failure = Failure.badRequest('current password is incorrect');
    when(() => usecase(any())).thenAnswer((_) async => const Left(failure));

    await container
        .read(changePasswordProvider.notifier)
        .submit(currentPassword: 'wrongpass', newPassword: 'newpass34');

    final state = container.read(changePasswordProvider);
    expect(state, isA<AsyncError<bool>>());
    expect(state.error, failure);
  });
}
