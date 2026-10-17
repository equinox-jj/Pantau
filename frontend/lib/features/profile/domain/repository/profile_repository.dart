import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';

abstract class ProfileRepository with BaseRepository {
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// The returned [CurrentUser] carries only the fields `/users/me` returns.
  Future<Either<Failure, CurrentUser>> uploadAvatar(String filePath);

  Future<Either<Failure, CurrentUser>> removeAvatar();
}
