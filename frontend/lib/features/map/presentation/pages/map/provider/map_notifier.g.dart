// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Owns every piece of state the map tab shows.

@ProviderFor(MapNotifier)
final mapProvider = MapNotifierProvider._();

/// Owns every piece of state the map tab shows.
final class MapNotifierProvider
    extends $NotifierProvider<MapNotifier, MapPageState> {
  /// Owns every piece of state the map tab shows.
  MapNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapNotifierHash();

  @$internal
  @override
  MapNotifier create() => MapNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapPageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapPageState>(value),
    );
  }
}

String _$mapNotifierHash() => r'e25fca7abca410556d279aa463099c9ab809b498';

/// Owns every piece of state the map tab shows.

abstract class _$MapNotifier extends $Notifier<MapPageState> {
  MapPageState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MapPageState, MapPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapPageState, MapPageState>,
              MapPageState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
