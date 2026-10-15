import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error.dart';
import '../../../auth/data/mapper/mapper.dart';
import '../../../auth/domain/entity/entity.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasources.dart';

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
