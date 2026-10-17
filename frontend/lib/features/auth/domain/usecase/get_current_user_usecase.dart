import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/auth/domain/repository/auth_repository.dart';

class GetCurrentUserUsecase extends UseCase<CurrentUser?, NoParams> {
  GetCurrentUserUsecase({required this._authRepository});

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, CurrentUser?>> call(NoParams params) =>
      _authRepository.getCurrentUser();
}
