import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error.dart';
import '../../../../core/local_storage/local_storage.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../domain/entity/entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasources/datasources.dart';
import '../mapper/mapper.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({
    required this._authRemoteDataSource,
    required this._tokenStorage,
    required this._userProfileStorage,
  });

  final AuthRemoteDataSource _authRemoteDataSource;
  final TokenStorage _tokenStorage;
  final UserProfileStorage _userProfileStorage;

  @override
  Future<Either<Failure, Register>> register({
    required String email,
    required String password,
    required String displayName,
  }) => safeCall(() async {
    final result = await _authRemoteDataSource.register(
      email: email,
      password: password,
      displayName: displayName,
    );
    final entity = result.toEntity();

    // The API signs the user in on register, so the token is persisted here
    // too — otherwise every authenticated call after sign-up returns 401.
    await _persistToken(entity.token);
    await _persistUser(
      uuid: entity.user?.uuid,
      email: entity.user?.email,
      displayName: entity.user?.displayName,
      role: entity.user?.role,
      createdAt: entity.user?.createdAt,
    );

    return entity;
  });

  @override
  Future<Either<Failure, Login>> login({
    required String email,
    required String password,
  }) => safeCall(() async {
    final result = await _authRemoteDataSource.login(
      email: email,
      password: password,
    );
    final entity = result.toEntity();

    // AuthInterceptor reads the token straight from storage, so it has to land
    // here before any authenticated request is made.
    await _persistToken(entity.token);
    await _persistUser(
      uuid: entity.user?.uuid,
      email: entity.user?.email,
      displayName: entity.user?.displayName,
      role: entity.user?.role,
      createdAt: entity.user?.createdAt,
    );

    return entity;
  });

  @override
  Future<Either<Failure, void>> logout() => safeCall(() async {
    await Future.wait([_tokenStorage.clear(), _userProfileStorage.clear()]);
  });

  @override
  Future<Either<Failure, CurrentUser?>> getCurrentUser() => safeCall(() async {
    final json = await _userProfileStorage.read();
    if (json == null) return null;

    final cached = CurrentUser(
      uuid: (json['uuid'] ?? json['id']) as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      displayName: json['display_name'] as String?,
      role: json['role'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.tryParse(json['created_at'] as String),
    );

    // `GET /users/me` refreshes display name and report stats. Its own
    // [uuid]/[createdAt] (joined date) take priority; cached email and role
    // remain because this endpoint does not return them.
    final profile = (await _authRemoteDataSource.getMe()).toEntity();

    return cached.copyWith(
      uuid: profile.uuid ?? cached.uuid,
      createdAt: profile.createdAt ?? cached.createdAt,
      displayName: profile.displayName ?? cached.displayName,
      reportsCount: profile.reportsCount,
      resolvedCount: profile.resolvedCount,
    );
  });

  @override
  Future<Either<Failure, UserRole>> getCachedRole() => safeCall(() async {
    final json = await _userProfileStorage.read();

    return UserRole.fromSlug(json?['role'] as String?);
  });

  Future<void> _persistToken(String? token) async {
    if (token == null || token.isEmpty) return;

    await _tokenStorage.saveTokens(accessToken: token);
  }

  Future<void> _persistUser({
    required String? uuid,
    required String? email,
    required String? displayName,
    required String? role,
    required DateTime? createdAt,
  }) async {
    // A login/register response with no user payload leaves the previous
    // cache (if any) untouched rather than overwriting it with nulls.
    if (uuid == null && email == null && displayName == null) return;

    await _userProfileStorage.save({
      'uuid': uuid,
      'email': email,
      'display_name': displayName,
      'role': role,
      'created_at': createdAt?.toIso8601String(),
    });
  }
}
