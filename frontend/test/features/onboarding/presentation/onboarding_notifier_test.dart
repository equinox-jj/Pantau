import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/onboarding/di/di.dart';
import 'package:pantau/features/onboarding/domain/usecase/usecase.dart';
import 'package:pantau/features/onboarding/presentation/pages/onboarding/provider/provider.dart';
import 'package:pantau/features/onboarding/presentation/widgets/onboarding_slide_data.dart';

class MockSetOnboardingSeenUsecase extends Mock
    implements SetOnboardingSeenUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(const NoParams());
  });

  late MockSetOnboardingSeenUsecase usecase;
  late ProviderContainer container;

  setUp(() {
    usecase = MockSetOnboardingSeenUsecase();
    container = ProviderContainer(
      overrides: [setOnboardingSeenUsecaseProvider.overrideWithValue(usecase)],
    );
    addTearDown(container.dispose);
  });

  OnboardingNotifier notifier() => container.read(onboardingProvider.notifier);

  test('initial state is the first slide with completion already settled', () {
    final state = container.read(onboardingProvider);

    expect(state.index, 0);
    expect(state.completion, const AsyncData<bool>(false));
  });

  group('next', () {
    test('advances the index by one', () {
      notifier().next();

      expect(container.read(onboardingProvider).index, 1);
    });

    test('does not advance past the last slide', () {
      final last = kOnboardingSlides.length - 1;
      for (var i = 0; i < kOnboardingSlides.length + 2; i++) {
        notifier().next();
      }

      expect(container.read(onboardingProvider).index, last);
    });
  });

  group('prev', () {
    test('is a no-op at the first slide', () {
      notifier().prev();

      expect(container.read(onboardingProvider).index, 0);
    });

    test('decrements the index once past the first slide', () {
      notifier().goTo(2);
      notifier().prev();

      expect(container.read(onboardingProvider).index, 1);
    });
  });

  group('goTo', () {
    test('jumps to the given index', () {
      notifier().goTo(2);

      expect(container.read(onboardingProvider).index, 2);
    });

    test('clamps below zero to the first slide', () {
      notifier().goTo(-5);

      expect(container.read(onboardingProvider).index, 0);
    });

    test('clamps above the last slide to the last slide', () {
      notifier().goTo(999);

      expect(
        container.read(onboardingProvider).index,
        kOnboardingSlides.length - 1,
      );
    });
  });

  group('complete', () {
    test(
      'marks completion as data(true) after the usecase resolves with Right',
      () async {
        when(() => usecase(any())).thenAnswer((_) async => const Right(null));

        await notifier().complete();

        expect(
          container.read(onboardingProvider).completion,
          const AsyncData<bool>(true),
        );
        verify(() => usecase(const NoParams())).called(1);
      },
    );

    test(
      'marks completion as data(true) even when the usecase fails',
      () async {
        when(() => usecase(any()))
            .thenAnswer((_) async => const Left(Failure.cache()));

        await notifier().complete();

        expect(
          container.read(onboardingProvider).completion,
          const AsyncData<bool>(true),
        );
      },
    );
  });
}
