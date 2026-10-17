import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/auth/domain/repository/auth_repository.dart';

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class LoginUsecase extends UseCase<Login, LoginParams> {
  LoginUsecase({required this._authRepository});

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, Login>> call(LoginParams params) =>
      _authRepository.login(email: params.email, password: params.password);
}
