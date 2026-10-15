import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../repository/repository.dart';

class ChangePasswordParams extends Equatable {
  const ChangePasswordParams({
    required this.currentPassword,
    required this.newPassword,
  });

  final String currentPassword;
  final String newPassword;

  @override
  List<Object?> get props => [currentPassword, newPassword];
}

class ChangePasswordUsecase extends UseCase<void, ChangePasswordParams> {
  ChangePasswordUsecase({required this._profileRepository});

  final ProfileRepository _profileRepository;

  @override
  Future<Either<Failure, void>> call(ChangePasswordParams params) =>
      _profileRepository.changePassword(
        currentPassword: params.currentPassword,
        newPassword: params.newPassword,
      );
}
