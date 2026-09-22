// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(onboardingLocalDataSource)
final onboardingLocalDataSourceProvider = OnboardingLocalDataSourceProvider._();

final class OnboardingLocalDataSourceProvider
    extends
        $FunctionalProvider<
          OnboardingLocalDataSource,
          OnboardingLocalDataSource,
          OnboardingLocalDataSource
        >
    with $Provider<OnboardingLocalDataSource> {
  OnboardingLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<OnboardingLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingLocalDataSource create(Ref ref) {
    return onboardingLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingLocalDataSource>(value),
    );
  }
}

String _$onboardingLocalDataSourceHash() =>
    r'86f9500d0226631d6488088350e0c71e6b6099ee';

@ProviderFor(onboardingRepository)
final onboardingRepositoryProvider = OnboardingRepositoryProvider._();

final class OnboardingRepositoryProvider
    extends
        $FunctionalProvider<
          OnboardingRepository,
          OnboardingRepository,
          OnboardingRepository
        >
    with $Provider<OnboardingRepository> {
  OnboardingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingRepositoryHash();

  @$internal
  @override
  $ProviderElement<OnboardingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingRepository create(Ref ref) {
    return onboardingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingRepository>(value),
    );
  }
}

String _$onboardingRepositoryHash() =>
    r'5d843630093a8bf325c108060da305127dda218c';

@ProviderFor(getOnboardingSeenUsecase)
final getOnboardingSeenUsecaseProvider = GetOnboardingSeenUsecaseProvider._();

final class GetOnboardingSeenUsecaseProvider
    extends
        $FunctionalProvider<
          GetOnboardingSeenUsecase,
          GetOnboardingSeenUsecase,
          GetOnboardingSeenUsecase
        >
    with $Provider<GetOnboardingSeenUsecase> {
  GetOnboardingSeenUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getOnboardingSeenUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getOnboardingSeenUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetOnboardingSeenUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetOnboardingSeenUsecase create(Ref ref) {
    return getOnboardingSeenUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetOnboardingSeenUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetOnboardingSeenUsecase>(value),
    );
  }
}

String _$getOnboardingSeenUsecaseHash() =>
    r'd2a8730a12ef00e2b07c9c525cc67ce68ce4b940';

@ProviderFor(setOnboardingSeenUsecase)
final setOnboardingSeenUsecaseProvider = SetOnboardingSeenUsecaseProvider._();

final class SetOnboardingSeenUsecaseProvider
    extends
        $FunctionalProvider<
          SetOnboardingSeenUsecase,
          SetOnboardingSeenUsecase,
          SetOnboardingSeenUsecase
        >
    with $Provider<SetOnboardingSeenUsecase> {
  SetOnboardingSeenUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setOnboardingSeenUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setOnboardingSeenUsecaseHash();

  @$internal
  @override
  $ProviderElement<SetOnboardingSeenUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SetOnboardingSeenUsecase create(Ref ref) {
    return setOnboardingSeenUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SetOnboardingSeenUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SetOnboardingSeenUsecase>(value),
    );
  }
}

String _$setOnboardingSeenUsecaseHash() =>
    r'2939f87690d6ab8e79562d57457680e4cb81a8d2';
