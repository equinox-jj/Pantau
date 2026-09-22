import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/core_di.dart';
import '../data/datasources/datasources.dart';
import '../data/repository/repository.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/usecase.dart';

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
  final repository = ref.read(onboardingRepositoryProvider);

  return GetOnboardingSeenUsecase(repository: repository);
}

@Riverpod(keepAlive: true)
SetOnboardingSeenUsecase setOnboardingSeenUsecase(Ref ref) {
  final repository = ref.read(onboardingRepositoryProvider);

  return SetOnboardingSeenUsecase(repository: repository);
}
