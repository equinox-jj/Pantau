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
  late SetOnboardingSeenUsecase usecase;

  setUp(() {
    repository = MockOnboardingRepository();
    usecase = SetOnboardingSeenUsecase(repository: repository);
  });

  test('delegates to repository.setOnboardingSeen and returns Right', () async {
    when(() => repository.setOnboardingSeen())
        .thenAnswer((_) async => const Right(null));

    final result = await usecase(const NoParams());

    expect(result.isRight(), isTrue);
    verify(() => repository.setOnboardingSeen()).called(1);
  });

  test('propagates a Left(Failure) from the repository unchanged', () async {
    when(() => repository.setOnboardingSeen())
        .thenAnswer((_) async => const Left(Failure.cache()));

    final result = await usecase(const NoParams());

    expect(result, const Left<Failure, void>(Failure.cache()));
  });
}
