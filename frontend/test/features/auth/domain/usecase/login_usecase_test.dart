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
  late LoginUsecase usecase;

  setUp(() {
    repository = MockAuthRepository();
    usecase = LoginUsecase(authRepository: repository);
  });

  test('LoginParams equatable props include email and password', () {
    const params = LoginParams(email: 'a@b.com', password: 'secret');
    expect(params.props, ['a@b.com', 'secret']);
  });

  test('delegates to repository.login with the params fields', () async {
    const login = Login(status: true);
    when(
      () => repository.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => const Right(login));

    final result = await usecase(
      const LoginParams(email: 'a@b.com', password: 'secret'),
    );

    expect(result, const Right<Failure, Login>(login));
    verify(() => repository.login(email: 'a@b.com', password: 'secret'))
        .called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(
      () => repository.login(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => const Left(Failure.unauthorized()));

    final result = await usecase(
      const LoginParams(email: 'a@b.com', password: 'wrong'),
    );

    expect(result, const Left<Failure, Login>(Failure.unauthorized()));
  });
}
