// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolver_location_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Owns the device-location request shared by every resolver tab that needs
/// "reports around me" (Queue, Map). One fetch feeds both — a resolver
/// switching tabs should not trigger a second GPS request for the same
/// purpose. Each consuming page's own listener turns a successful fix into
/// its own load call and every other outcome into its own designed state.

@ProviderFor(ResolverLocation)
final resolverLocationProvider = ResolverLocationProvider._();

/// Owns the device-location request shared by every resolver tab that needs
/// "reports around me" (Queue, Map). One fetch feeds both — a resolver
/// switching tabs should not trigger a second GPS request for the same
/// purpose. Each consuming page's own listener turns a successful fix into
/// its own load call and every other outcome into its own designed state.
final class ResolverLocationProvider
    extends $NotifierProvider<ResolverLocation, AsyncValue<LocationResult?>> {
  /// Owns the device-location request shared by every resolver tab that needs
  /// "reports around me" (Queue, Map). One fetch feeds both — a resolver
  /// switching tabs should not trigger a second GPS request for the same
  /// purpose. Each consuming page's own listener turns a successful fix into
  /// its own load call and every other outcome into its own designed state.
  ResolverLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resolverLocationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resolverLocationHash();

  @$internal
  @override
  ResolverLocation create() => ResolverLocation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<LocationResult?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<LocationResult?>>(value),
    );
  }
}

String _$resolverLocationHash() => r'11a87d155b7311ec6486d63198fb3ce9cd2c39fb';

/// Owns the device-location request shared by every resolver tab that needs
/// "reports around me" (Queue, Map). One fetch feeds both — a resolver
/// switching tabs should not trigger a second GPS request for the same
/// purpose. Each consuming page's own listener turns a successful fix into
/// its own load call and every other outcome into its own designed state.

abstract class _$ResolverLocation
    extends $Notifier<AsyncValue<LocationResult?>> {
  AsyncValue<LocationResult?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<LocationResult?>, AsyncValue<LocationResult?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<LocationResult?>,
                AsyncValue<LocationResult?>
              >,
              AsyncValue<LocationResult?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
