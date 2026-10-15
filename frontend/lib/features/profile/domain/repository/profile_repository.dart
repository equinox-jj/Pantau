import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../../../auth/domain/entity/entity.dart';

abstract class ProfileRepository with BaseRepository {
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// The returned [CurrentUser] carries only the fields `/users/me` returns.
  Future<Either<Failure, CurrentUser>> uploadAvatar(String filePath);

  Future<Either<Failure, CurrentUser>> removeAvatar();
}
