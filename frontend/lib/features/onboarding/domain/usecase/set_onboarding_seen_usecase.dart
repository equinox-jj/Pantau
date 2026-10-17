import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/onboarding/domain/repository/onboarding_repository.dart';

class SetOnboardingSeenUsecase extends UseCase<void, NoParams> {
  SetOnboardingSeenUsecase({required this._repository});

  final OnboardingRepository _repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) =>
      _repository.setOnboardingSeen();
}
