// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_address_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Street address of a pinned coordinate, or `null` when the point has no
/// addressable feature.
///
/// Keyed by coordinate, so a pin the user drags back to a spot they already
/// visited is answered from cache instead of another Nominatim call. Callers
/// round the key (see [roundedCoordinate]) — raw camera centres never repeat.

@ProviderFor(pinAddress)
final pinAddressProvider = PinAddressFamily._();

/// Street address of a pinned coordinate, or `null` when the point has no
/// addressable feature.
///
/// Keyed by coordinate, so a pin the user drags back to a spot they already
/// visited is answered from cache instead of another Nominatim call. Callers
/// round the key (see [roundedCoordinate]) — raw camera centres never repeat.

final class PinAddressProvider
    extends $FunctionalProvider<AsyncValue<Place?>, Place?, FutureOr<Place?>>
    with $FutureModifier<Place?>, $FutureProvider<Place?> {
  /// Street address of a pinned coordinate, or `null` when the point has no
  /// addressable feature.
  ///
  /// Keyed by coordinate, so a pin the user drags back to a spot they already
  /// visited is answered from cache instead of another Nominatim call. Callers
  /// round the key (see [roundedCoordinate]) — raw camera centres never repeat.
  PinAddressProvider._({
    required PinAddressFamily super.from,
    required ({double latitude, double longitude}) super.argument,
  }) : super(
         retry: null,
         name: r'pinAddressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pinAddressHash();

  @override
  String toString() {
    return r'pinAddressProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<Place?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Place?> create(Ref ref) {
    final argument = this.argument as ({double latitude, double longitude});
    return pinAddress(
      ref,
      latitude: argument.latitude,
      longitude: argument.longitude,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PinAddressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pinAddressHash() => r'703268b1eb1c75013a194c61b4d6a95d0e5f8f1a';

/// Street address of a pinned coordinate, or `null` when the point has no
/// addressable feature.
///
/// Keyed by coordinate, so a pin the user drags back to a spot they already
/// visited is answered from cache instead of another Nominatim call. Callers
/// round the key (see [roundedCoordinate]) — raw camera centres never repeat.

final class PinAddressFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Place?>,
          ({double latitude, double longitude})
        > {
  PinAddressFamily._()
    : super(
        retry: null,
        name: r'pinAddressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Street address of a pinned coordinate, or `null` when the point has no
  /// addressable feature.
  ///
  /// Keyed by coordinate, so a pin the user drags back to a spot they already
  /// visited is answered from cache instead of another Nominatim call. Callers
  /// round the key (see [roundedCoordinate]) — raw camera centres never repeat.

  PinAddressProvider call({
    required double latitude,
    required double longitude,
  }) => PinAddressProvider._(
    argument: (latitude: latitude, longitude: longitude),
    from: this,
  );

  @override
  String toString() => r'pinAddressProvider';
}
