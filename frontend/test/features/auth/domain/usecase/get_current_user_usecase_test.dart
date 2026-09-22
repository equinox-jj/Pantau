import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/auth/domain/repository/repository.dart';
import 'package:pantau/features/auth/domain/usecase/usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late GetCurrentUserUsecase usecase;

  setUp(() {
    repository = MockAuthRepository();
    usecase = GetCurrentUserUsecase(authRepository: repository);
  });

  test('delegates to repository.getCurrentUser', () async {
    const user = CurrentUser(uuid: 'u1');
    when(() => repository.getCurrentUser())
        .thenAnswer((_) async => const Right(user));

    final result = await usecase(const NoParams());

    expect(result, const Right<Failure, CurrentUser?>(user));
    verify(() => repository.getCurrentUser()).called(1);
  });

  test(
    'propagates a Right(null) from the repository when nothing is cached',
    () async {
      when(() => repository.getCurrentUser())
          .thenAnswer((_) async => const Right(null));

      final result = await usecase(const NoParams());

      expect(result, const Right<Failure, CurrentUser?>(null));
    },
  );

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(() => repository.getCurrentUser())
        .thenAnswer((_) async => const Left(Failure.network()));

    final result = await usecase(const NoParams());

    expect(result, const Left<Failure, CurrentUser?>(Failure.network()));
  });
}
