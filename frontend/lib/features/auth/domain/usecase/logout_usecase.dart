import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/domain/repository/auth_repository.dart';

class LogoutUsecase extends UseCase<void, NoParams> {
  LogoutUsecase({required this._authRepository});

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) =>
      _authRepository.logout();
}
