import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/base/base.dart';
import '../../../core/di/core_di.dart';
import '../data/datasources/datasources.dart';
import '../data/repository/repository.dart';
import '../domain/entity/entity.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/usecase.dart';

part 'auth_di.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);

  return AuthRemoteDataSourceImpl(dioClient: dioClient);
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  final authRemoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final tokenStorage = ref.watch(tokenStorageProvider);
  final userProfileStorage = ref.watch(userProfileStorageProvider);

  return AuthRepositoryImpl(
    authRemoteDataSource: authRemoteDataSource,
    tokenStorage: tokenStorage,
    userProfileStorage: userProfileStorage,
  );
}

@Riverpod(keepAlive: true)
LoginUsecase loginUsecase(Ref ref) {
  final authRepository = ref.read(authRepositoryProvider);

  return LoginUsecase(authRepository: authRepository);
}

@Riverpod(keepAlive: true)
LogoutUsecase logoutUsecase(Ref ref) {
  final authRepository = ref.read(authRepositoryProvider);

  return LogoutUsecase(authRepository: authRepository);
}

@Riverpod(keepAlive: true)
RegisterUsecase registerUsecase(Ref ref) {
  final authRepository = ref.read(authRepositoryProvider);

  return RegisterUsecase(authRepository: authRepository);
}

@Riverpod(keepAlive: true)
GetCurrentUserUsecase getCurrentUserUsecase(Ref ref) {
  final authRepository = ref.read(authRepositoryProvider);

  return GetCurrentUserUsecase(authRepository: authRepository);
}

@Riverpod(keepAlive: true)
GetCachedRoleUsecase getCachedRoleUsecase(Ref ref) {
  final authRepository = ref.read(authRepositoryProvider);

  return GetCachedRoleUsecase(authRepository: authRepository);
}

/// The cached identity of the signed-in user. Throws the [Failure] rather
/// than folding it to `null`, so it surfaces through `AsyncError` the same
/// way every other screen in this app reads a failed call.
@riverpod
Future<CurrentUser?> currentUser(Ref ref) async {
  final usecase = ref.read(getCurrentUserUsecaseProvider);
  final result = await usecase(const NoParams());

  return result.fold((failure) => throw failure, (user) => user);
}
