import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/auth/domain/repository/repository.dart';
import 'package:pantau/features/auth/domain/usecase/usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository repository;
  late RegisterUsecase usecase;

  setUp(() {
    repository = MockAuthRepository();
    usecase = RegisterUsecase(authRepository: repository);
  });

  test(
    'RegisterParams equatable props include displayName, email, and password',
    () {
      const params = RegisterParams(
        displayName: 'Alice',
        email: 'a@b.com',
        password: 'secret',
      );
      expect(params.props, ['Alice', 'a@b.com', 'secret']);
    },
  );

  test('delegates to repository.register with the params fields', () async {
    final register = Register(status: true);
    when(
      () => repository.register(
        email: any(named: 'email'),
        password: any(named: 'password'),
        displayName: any(named: 'displayName'),
      ),
    ).thenAnswer((_) async => Right(register));

    final result = await usecase(
      const RegisterParams(
        displayName: 'Alice',
        email: 'a@b.com',
        password: 'secret',
      ),
    );

    expect(result, Right<Failure, Register>(register));
    verify(
      () => repository.register(
        email: 'a@b.com',
        password: 'secret',
        displayName: 'Alice',
      ),
    ).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.register(
        email: any(named: 'email'),
        password: any(named: 'password'),
        displayName: any(named: 'displayName'),
      ),
    ).thenAnswer((_) async => const Left(Failure.validation({})));

    final result = await usecase(
      const RegisterParams(
        displayName: 'Alice',
        email: 'a@b.com',
        password: 'secret',
      ),
    );

    expect(result, const Left<Failure, Register>(Failure.validation({})));
  });
}
