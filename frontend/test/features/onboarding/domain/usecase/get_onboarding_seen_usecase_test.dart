import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/onboarding/domain/repository/repository.dart';
import 'package:pantau/features/onboarding/domain/usecase/usecase.dart';

class MockOnboardingRepository extends Mock implements OnboardingRepository {}

void main() {
  late MockOnboardingRepository repository;
  late GetOnboardingSeenUsecase usecase;

  setUp(() {
    repository = MockOnboardingRepository();
    usecase = GetOnboardingSeenUsecase(repository: repository);
  });

  test('delegates to repository.hasSeenOnboarding and returns Right', () async {
    when(() => repository.hasSeenOnboarding())
        .thenAnswer((_) async => const Right(true));

    final result = await usecase(const NoParams());

    expect(result, const Right<Failure, bool>(true));
    verify(() => repository.hasSeenOnboarding()).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(() => repository.hasSeenOnboarding())
        .thenAnswer((_) async => const Left(Failure.cache()));

    final result = await usecase(const NoParams());

    expect(result, const Left<Failure, bool>(Failure.cache()));
  });
}
