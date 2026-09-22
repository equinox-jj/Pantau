import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';

abstract class OnboardingRepository with BaseRepository {
  Future<Either<Failure, bool>> hasSeenOnboarding();
  Future<Either<Failure, void>> setOnboardingSeen();
}
