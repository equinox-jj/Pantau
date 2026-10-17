import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/features/onboarding/data/datasources/onboarding_local_datasource.dart';
import 'package:pantau/features/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:pantau/features/onboarding/domain/repository/onboarding_repository.dart';
import 'package:pantau/features/onboarding/domain/usecase/usecase.dart';

part 'onboarding_di.g.dart';

@Riverpod(keepAlive: true)
OnboardingLocalDataSource onboardingLocalDataSource(Ref ref) {
  final prefs = ref.watch(localPrefProvider);

  return OnboardingLocalDataSourceImpl(prefs: prefs);
}

@Riverpod(keepAlive: true)
OnboardingRepository onboardingRepository(Ref ref) {
  final localDataSource = ref.watch(onboardingLocalDataSourceProvider);

  return OnboardingRepositoryImpl(localDataSource: localDataSource);
}

@Riverpod(keepAlive: true)
GetOnboardingSeenUsecase getOnboardingSeenUsecase(Ref ref) {
  final repository = ref.watch(onboardingRepositoryProvider);

  return GetOnboardingSeenUsecase(repository: repository);
}

@Riverpod(keepAlive: true)
SetOnboardingSeenUsecase setOnboardingSeenUsecase(Ref ref) {
  final repository = ref.watch(onboardingRepositoryProvider);

  return SetOnboardingSeenUsecase(repository: repository);
}
