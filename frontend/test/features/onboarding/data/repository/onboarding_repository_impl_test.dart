import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/onboarding/data/datasources/datasources.dart';
import 'package:pantau/features/onboarding/data/repository/repository.dart';

class MockOnboardingLocalDataSource extends Mock
    implements OnboardingLocalDataSource {}

void main() {
  late MockOnboardingLocalDataSource dataSource;
  late OnboardingRepositoryImpl repository;

  setUp(() {
    dataSource = MockOnboardingLocalDataSource();
    repository = OnboardingRepositoryImpl(localDataSource: dataSource);
  });

  group('hasSeenOnboarding', () {
    test('returns Right(true) on success', () async {
      when(() => dataSource.hasSeenOnboarding()).thenAnswer((_) async => true);

      final result = await repository.hasSeenOnboarding();

      expect(result, const Right<Failure, bool>(true));
    });

    test('returns Right(false) on success', () async {
      when(() => dataSource.hasSeenOnboarding()).thenAnswer((_) async => false);

      final result = await repository.hasSeenOnboarding();

      expect(result, const Right<Failure, bool>(false));
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(() => dataSource.hasSeenOnboarding())
          .thenThrow(const CacheException('boom'));

      final result = await repository.hasSeenOnboarding();

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, equals(const Failure.cache('boom'))),
        (r) => fail('expected Left, got Right'),
      );
    });
  });

  group('setOnboardingSeen', () {
    test('returns Right(unit) on success', () async {
      when(() => dataSource.setOnboardingSeen()).thenAnswer((_) async {});

      final result = await repository.setOnboardingSeen();

      expect(result.isRight(), isTrue);
    });

    test('returns Left(Failure) when the data source throws', () async {
      when(() => dataSource.setOnboardingSeen())
          .thenThrow(const CacheException('boom'));

      final result = await repository.setOnboardingSeen();

      expect(result.isLeft(), isTrue);
      result.fold(
        (l) => expect(l, equals(const Failure.cache('boom'))),
        (r) => fail('expected Left, got Right'),
      );
    });
  });
}
