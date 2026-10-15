import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../../../auth/domain/entity/entity.dart';
import '../repository/repository.dart';

class RemoveAvatarUsecase extends UseCase<CurrentUser, NoParams> {
  RemoveAvatarUsecase({required this._profileRepository});

  final ProfileRepository _profileRepository;

  @override
  Future<Either<Failure, CurrentUser>> call(NoParams params) =>
      _profileRepository.removeAvatar();
}
