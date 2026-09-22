import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/error/exceptions.dart';
import 'package:pantau/core/local_storage/local_storage.dart';
import 'package:pantau/features/onboarding/data/datasources/datasources.dart';

class MockLocalPref extends Mock implements LocalPref {}

void main() {
  late MockLocalPref prefs;
  late OnboardingLocalDataSourceImpl dataSource;

  setUp(() {
    prefs = MockLocalPref();
    dataSource = OnboardingLocalDataSourceImpl(prefs: prefs);
  });

  group('hasSeenOnboarding', () {
    test('returns true when the pref is set', () async {
      when(() => prefs.hasOnboardingSeen()).thenReturn(true);

      final result = await dataSource.hasSeenOnboarding();

      expect(result, isTrue);
    });

    test('returns false when the pref is unset', () async {
      when(() => prefs.hasOnboardingSeen()).thenReturn(false);

      final result = await dataSource.hasSeenOnboarding();

      expect(result, isFalse);
    });

    test('wraps a thrown error as a CacheException', () async {
      when(() => prefs.hasOnboardingSeen()).thenThrow(StateError('boom'));

      await expectLater(
        dataSource.hasSeenOnboarding(),
        throwsA(isA<CacheException>()),
      );
    });

    test('rethrows an existing CacheException unchanged', () async {
      when(() => prefs.hasOnboardingSeen())
          .thenThrow(const CacheException('already cache'));

      await expectLater(
        dataSource.hasSeenOnboarding(),
        throwsA(
          isA<CacheException>().having(
            (e) => e.message,
            'message',
            'already cache',
          ),
        ),
      );
    });
  });

  group('setOnboardingSeen', () {
    test('sets the pref to true', () async {
      when(() => prefs.setOnboardingSeen(true)).thenAnswer((_) async {});

      await dataSource.setOnboardingSeen();

      verify(() => prefs.setOnboardingSeen(true)).called(1);
    });

    test('wraps a thrown error as a CacheException', () async {
      when(() => prefs.setOnboardingSeen(true)).thenThrow(StateError('boom'));

      await expectLater(
        dataSource.setOnboardingSeen(),
        throwsA(isA<CacheException>()),
      );
    });

    test('rethrows an existing CacheException unchanged', () async {
      when(() => prefs.setOnboardingSeen(true))
          .thenThrow(const CacheException('already cache'));

      await expectLater(
        dataSource.setOnboardingSeen(),
        throwsA(isA<CacheException>()),
      );
    });
  });
}
