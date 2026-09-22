import 'package:fpdart/fpdart.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utils/enums/enums.dart';

abstract class AuthRepository with BaseRepository {
  Future<Either<Failure, Register>> register({
    required String email,
    required String password,
    required String displayName,
  });
  Future<Either<Failure, Login>> login({
    required String email,
    required String password,
  });

  /// Drops the stored session. Local-only — the API has no logout endpoint.
  Future<Either<Failure, void>> logout();

  Future<Either<Failure, CurrentUser?>> getCurrentUser();

  /// Role of the cached profile, read from local storage only — no network
  /// call. `UserRole.unknown` if nothing is cached.
  Future<Either<Failure, UserRole>> getCachedRole();
}
