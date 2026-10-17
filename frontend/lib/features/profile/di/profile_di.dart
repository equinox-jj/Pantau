import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:pantau/features/profile/data/repository/profile_repository_impl.dart';
import 'package:pantau/features/profile/domain/repository/profile_repository.dart';
import 'package:pantau/features/profile/domain/usecase/usecase.dart';

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
  final profileRepository = ref.watch(profileRepositoryProvider);

  return ChangePasswordUsecase(profileRepository: profileRepository);
}

@Riverpod(keepAlive: true)
UploadAvatarUsecase uploadAvatarUsecase(Ref ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);

  return UploadAvatarUsecase(profileRepository: profileRepository);
}

@Riverpod(keepAlive: true)
RemoveAvatarUsecase removeAvatarUsecase(Ref ref) {
  final profileRepository = ref.watch(profileRepositoryProvider);

  return RemoveAvatarUsecase(profileRepository: profileRepository);
}
