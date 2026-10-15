import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/core_di.dart';
import '../data/datasources/datasources.dart';
import '../data/repository/repository.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/usecase.dart';

part 'profile_di.g.dart';

@Riverpod(keepAlive: true)
ProfileRemoteDataSource profileRemoteDataSource(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);

  return ProfileRemoteDataSourceImpl(dioClient: dioClient);
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(Ref ref) {
  final profileRemoteDataSource = ref.watch(profileRemoteDataSourceProvider);

  return ProfileRepositoryImpl(
    profileRemoteDataSource: profileRemoteDataSource,
  );
}

@Riverpod(keepAlive: true)
ChangePasswordUsecase changePasswordUsecase(Ref ref) {
  final profileRepository = ref.read(profileRepositoryProvider);

  return ChangePasswordUsecase(profileRepository: profileRepository);
}

@Riverpod(keepAlive: true)
UploadAvatarUsecase uploadAvatarUsecase(Ref ref) {
  final profileRepository = ref.read(profileRepositoryProvider);

  return UploadAvatarUsecase(profileRepository: profileRepository);
}

@Riverpod(keepAlive: true)
RemoveAvatarUsecase removeAvatarUsecase(Ref ref) {
  final profileRepository = ref.read(profileRepositoryProvider);

  return RemoveAvatarUsecase(profileRepository: profileRepository);
}
