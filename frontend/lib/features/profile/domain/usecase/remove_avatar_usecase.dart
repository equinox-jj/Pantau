import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/profile/domain/repository/profile_repository.dart';

class RemoveAvatarUsecase extends UseCase<CurrentUser, NoParams> {
  RemoveAvatarUsecase({required this._profileRepository});

  final ProfileRepository _profileRepository;

  @override
  Future<Either<Failure, CurrentUser>> call(NoParams params) =>
      _profileRepository.removeAvatar();
}
