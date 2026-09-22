import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utils/enums/enums.dart';
import '../repository/repository.dart';

class GetCachedRoleUsecase extends UseCase<UserRole, NoParams> {
  GetCachedRoleUsecase({required this._authRepository});

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, UserRole>> call(NoParams params) =>
      _authRepository.getCachedRole();
}
