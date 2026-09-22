import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../repository/repository.dart';

class LogoutUsecase extends UseCase<void, NoParams> {
  LogoutUsecase({required this._authRepository});

  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) =>
      _authRepository.logout();
}
