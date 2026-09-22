import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.displayName,
    required this.email,
    required this.password,
  });

  final String displayName;
  final String email;
  final String password;

  @override
  List<Object?> get props => [displayName, email, password];
}

class RegisterUsecase extends UseCase<Register, RegisterParams> {
  RegisterUsecase({required this._authRepository});

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, Register>> call(RegisterParams params) =>
      _authRepository.register(
        displayName: params.displayName,
        email: params.email,
        password: params.password,
      );
}
