import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

class GetCurrentUserUsecase extends UseCase<CurrentUser?, NoParams> {
  GetCurrentUserUsecase({required this._authRepository});

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, CurrentUser?>> call(NoParams params) =>
      _authRepository.getCurrentUser();
}
