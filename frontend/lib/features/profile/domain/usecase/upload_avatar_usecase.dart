import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../../../auth/domain/entity/entity.dart';
import '../repository/repository.dart';

/// Params: path of the picked image file.
class UploadAvatarUsecase extends UseCase<CurrentUser, String> {
  UploadAvatarUsecase({required this._profileRepository});

  final ProfileRepository _profileRepository;

  @override
  Future<Either<Failure, CurrentUser>> call(String params) =>
      _profileRepository.uploadAvatar(params);
}
