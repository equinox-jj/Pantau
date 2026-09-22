import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error.dart';
import '../../domain/repository/onboarding_repository.dart';
import '../datasources/onboarding_local_datasource.dart';

class OnboardingRepositoryImpl extends OnboardingRepository {
  OnboardingRepositoryImpl({required this._localDataSource});

  final OnboardingLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, bool>> hasSeenOnboarding() =>
      safeCall(() => _localDataSource.hasSeenOnboarding());

  @override
  Future<Either<Failure, void>> setOnboardingSeen() =>
      safeCall(() => _localDataSource.setOnboardingSeen());
}
