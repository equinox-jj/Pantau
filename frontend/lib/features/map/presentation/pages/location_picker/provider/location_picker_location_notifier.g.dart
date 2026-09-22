// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_picker_location_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Owns the device-location request for the location picker's "locate me"
/// control. Holds the raw [LocationResult] so the permission overlay can
/// branch on the same outcomes as the map and feed tabs.

@ProviderFor(LocationPickerLocation)
final locationPickerLocationProvider = LocationPickerLocationProvider._();

/// Owns the device-location request for the location picker's "locate me"
/// control. Holds the raw [LocationResult] so the permission overlay can
/// branch on the same outcomes as the map and feed tabs.
final class LocationPickerLocationProvider
    extends
        $NotifierProvider<LocationPickerLocation, AsyncValue<LocationResult?>> {
  /// Owns the device-location request for the location picker's "locate me"
  /// control. Holds the raw [LocationResult] so the permission overlay can
  /// branch on the same outcomes as the map and feed tabs.
  LocationPickerLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationPickerLocationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationPickerLocationHash();

  @$internal
  @override
  LocationPickerLocation create() => LocationPickerLocation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<LocationResult?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<LocationResult?>>(value),
    );
  }
}

String _$locationPickerLocationHash() =>
    r'9cff6724b326ac0bec79816148c79c5422d603f8';

/// Owns the device-location request for the location picker's "locate me"
/// control. Holds the raw [LocationResult] so the permission overlay can
/// branch on the same outcomes as the map and feed tabs.

abstract class _$LocationPickerLocation
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
