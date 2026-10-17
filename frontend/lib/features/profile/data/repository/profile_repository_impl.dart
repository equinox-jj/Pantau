import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/auth/data/mapper/mapper.dart';
import 'package:pantau/features/auth/domain/entity/entity.dart';
import 'package:pantau/features/profile/domain/repository/profile_repository.dart';
import 'package:pantau/features/profile/data/datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl({required this._profileRemoteDataSource});

  final ProfileRemoteDataSource _profileRemoteDataSource;

  @override
  Future<Either<Failure, void>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) => safeCall(
    () => _profileRemoteDataSource.changePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    ),
  );

  @override
  Future<Either<Failure, CurrentUser>> uploadAvatar(String filePath) =>
      safeCall(
        () async =>
            (await _profileRemoteDataSource.uploadAvatar(filePath)).toEntity(),
      );

  @override
  Future<Either<Failure, CurrentUser>> removeAvatar() => safeCall(
    () async => (await _profileRemoteDataSource.removeAvatar()).toEntity(),
  );
}
