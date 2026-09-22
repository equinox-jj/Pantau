import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../repository/onboarding_repository.dart';

class GetOnboardingSeenUsecase extends UseCase<bool, NoParams> {
  GetOnboardingSeenUsecase({required this._repository});

  final OnboardingRepository _repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) =>
      _repository.hasSeenOnboarding();
}
