import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../core/base/base.dart';
import '../../../../di/di.dart';
import '../../../widgets/onboarding_slide_data.dart';

part 'onboarding_notifier.freezed.dart';
part 'onboarding_notifier.g.dart';

/// The onboarding carousel: which slide is showing, and whether "seen" has
/// been persisted.
@freezed
abstract class OnboardingPageState with _$OnboardingPageState {
  const factory OnboardingPageState({
    @Default(0) int index,

    /// Best-effort persistence of "onboarding seen". Navigation proceeds even
    /// on failure — worst case the user sees onboarding again.
    @Default(AsyncData(false)) AsyncValue<bool> completion,
  }) = _OnboardingPageState;
}

@riverpod
class OnboardingNotifier extends _$OnboardingNotifier {
  @override
  OnboardingPageState build() => const OnboardingPageState();

  void next() {
    if (state.index < kOnboardingSlides.length - 1) {
      state = state.copyWith(index: state.index + 1);
    }
  }

  void prev() {
    if (state.index > 0) state = state.copyWith(index: state.index - 1);
  }

  void goTo(int index) {
    state = state.copyWith(index: index.clamp(0, kOnboardingSlides.length - 1));
  }

  /// Marks onboarding as seen. Best-effort: navigation proceeds even if
  /// persistence fails — worst case the user sees onboarding again.
  Future<void> complete() async {
    state = state.copyWith(completion: const AsyncLoading());

    final usecase = ref.read(setOnboardingSeenUsecaseProvider);
    await usecase(const NoParams());

    state = state.copyWith(completion: const AsyncData(true));
  }
}
