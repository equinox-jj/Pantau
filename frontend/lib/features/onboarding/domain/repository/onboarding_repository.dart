import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';

abstract class OnboardingRepository with BaseRepository {
  Future<Either<Failure, bool>> hasSeenOnboarding();
  Future<Either<Failure, void>> setOnboardingSeen();
}
