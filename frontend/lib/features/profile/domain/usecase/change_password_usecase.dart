import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/profile/domain/repository/profile_repository.dart';

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
