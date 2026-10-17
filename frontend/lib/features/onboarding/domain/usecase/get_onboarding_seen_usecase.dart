import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/onboarding/domain/repository/onboarding_repository.dart';

class GetOnboardingSeenUsecase extends UseCase<bool, NoParams> {
  GetOnboardingSeenUsecase({required this._repository});

  final OnboardingRepository _repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) =>
      _repository.hasSeenOnboarding();
}
