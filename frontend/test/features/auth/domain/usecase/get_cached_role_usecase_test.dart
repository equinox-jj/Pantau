import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/auth/domain/repository/repository.dart';
import 'package:pantau/features/auth/domain/usecase/usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late GetCachedRoleUsecase usecase;

  setUp(() {
    repository = MockAuthRepository();
    usecase = GetCachedRoleUsecase(authRepository: repository);
  });

  test('delegates to repository.getCachedRole', () async {
    when(() => repository.getCachedRole())
        .thenAnswer((_) async => const Right(UserRole.resolver));

    final result = await usecase(const NoParams());

    expect(result, const Right<Failure, UserRole>(UserRole.resolver));
    verify(() => repository.getCachedRole()).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(() => repository.getCachedRole())
        .thenAnswer((_) async => const Left(Failure.cache()));

    final result = await usecase(const NoParams());

    expect(result, const Left<Failure, UserRole>(Failure.cache()));
  });
}
