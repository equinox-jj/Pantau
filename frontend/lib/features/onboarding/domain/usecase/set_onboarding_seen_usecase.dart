import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../repository/onboarding_repository.dart';

class SetOnboardingSeenUsecase extends UseCase<void, NoParams> {
  SetOnboardingSeenUsecase({required this._repository});

  final OnboardingRepository _repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) =>
      _repository.setOnboardingSeen();
}
