// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnboardingNotifier)
final onboardingProvider = OnboardingNotifierProvider._();

final class OnboardingNotifierProvider
    extends $NotifierProvider<OnboardingNotifier, OnboardingPageState> {
  OnboardingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingNotifierHash();

  @$internal
  @override
  OnboardingNotifier create() => OnboardingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingPageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingPageState>(value),
    );
  }
}

String _$onboardingNotifierHash() =>
    r'8f08b3ccb545fcadc611bf8023bf9cba3ead2e31';

abstract class _$OnboardingNotifier extends $Notifier<OnboardingPageState> {
  OnboardingPageState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<OnboardingPageState, OnboardingPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OnboardingPageState, OnboardingPageState>,
              OnboardingPageState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
