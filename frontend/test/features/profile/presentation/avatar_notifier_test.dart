import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/di/di.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/auth/domain/usecase/usecase.dart';
import 'package:pantau/features/profile/di/di.dart';
import 'package:pantau/features/profile/domain/usecase/usecase.dart';
import 'package:pantau/features/profile/presentation/pages/profile/provider/provider.dart';

class MockUploadAvatarUsecase extends Mock implements UploadAvatarUsecase {}

class MockRemoveAvatarUsecase extends Mock implements RemoveAvatarUsecase {}

class MockGetCurrentUserUsecase extends Mock implements GetCurrentUserUsecase {}

void main() {
  setUpAll(() => registerFallbackValue(const NoParams()));

  late MockUploadAvatarUsecase uploadUsecase;
  late MockRemoveAvatarUsecase removeUsecase;
  late MockGetCurrentUserUsecase currentUserUsecase;
  late ProviderContainer container;

  setUp(() {
    uploadUsecase = MockUploadAvatarUsecase();
    removeUsecase = MockRemoveAvatarUsecase();
    currentUserUsecase = MockGetCurrentUserUsecase();
    when(
      () => currentUserUsecase(any()),
    ).thenAnswer((_) async => const Right(CurrentUser(uuid: 'u1')));
    container = ProviderContainer(
      overrides: [
        uploadAvatarUsecaseProvider.overrideWithValue(uploadUsecase),
        removeAvatarUsecaseProvider.overrideWithValue(removeUsecase),
        getCurrentUserUsecaseProvider.overrideWithValue(currentUserUsecase),
      ],
    );
    addTearDown(container.dispose);
  });

  test('upload calls usecase and invalidates currentUser', () async {
    when(() => uploadUsecase('/tmp/a.png')).thenAnswer(
      (_) async => const Right(CurrentUser(uuid: 'u1', avatarUrl: 'x')),
    );
    container.listen(currentUserProvider, (_, _) {});
    await container.read(currentUserProvider.future);

    await container.read(avatarProvider.notifier).upload('/tmp/a.png');
    await container.read(currentUserProvider.future);

    verify(() => uploadUsecase('/tmp/a.png')).called(1);
    verify(() => currentUserUsecase(any())).called(2);
    expect(container.read(avatarProvider), isA<AsyncData<void>>());
  });

  test('null path does nothing', () async {
    final states = <AsyncValue<void>>[];
    container.listen(avatarProvider, (_, next) => states.add(next));

    await container.read(avatarProvider.notifier).upload(null);

    verifyNever(() => uploadUsecase(any()));
    expect(states, isEmpty);
  });

  test('remove failure becomes AsyncError', () async {
    const failure = Failure.server(500, 'boom');
    when(() => removeUsecase(any())).thenAnswer((_) async => const Left(failure));

    await container.read(avatarProvider.notifier).remove();

    final state = container.read(avatarProvider);
    expect(state, isA<AsyncError<void>>());
    expect(state.error, failure);
  });
}
