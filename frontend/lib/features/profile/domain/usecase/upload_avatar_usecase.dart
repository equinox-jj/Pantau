import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/profile/domain/repository/profile_repository.dart';

/// Params: path of the picked image file.
class UploadAvatarUsecase extends UseCase<CurrentUser, String> {
  UploadAvatarUsecase({required this._profileRepository});

  final ProfileRepository _profileRepository;

  @override
  Future<Either<Failure, CurrentUser>> call(String params) =>
      _profileRepository.uploadAvatar(params);
}
