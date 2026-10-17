// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Results of the place-search screen.
///
/// `null` means nothing has been searched yet — distinct from
/// `AsyncData([])`, which means "searched, found nothing". Auto-disposed, so
/// the results die with the screen.

@ProviderFor(PlaceSearchNotifier)
final placeSearchProvider = PlaceSearchNotifierProvider._();

/// Results of the place-search screen.
///
/// `null` means nothing has been searched yet — distinct from
/// `AsyncData([])`, which means "searched, found nothing". Auto-disposed, so
/// the results die with the screen.
final class PlaceSearchNotifierProvider
    extends $NotifierProvider<PlaceSearchNotifier, AsyncValue<List<Place>>?> {
  /// Results of the place-search screen.
  ///
  /// `null` means nothing has been searched yet — distinct from
  /// `AsyncData([])`, which means "searched, found nothing". Auto-disposed, so
  /// the results die with the screen.
  PlaceSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'placeSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$placeSearchNotifierHash();

  @$internal
  @override
  PlaceSearchNotifier create() => PlaceSearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<List<Place>>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<List<Place>>?>(value),
    );
  }
}

String _$placeSearchNotifierHash() =>
    r'86ff86745c005f5cec46f538e953bd6edb85560b';

/// Results of the place-search screen.
///
/// `null` means nothing has been searched yet — distinct from
/// `AsyncData([])`, which means "searched, found nothing". Auto-disposed, so
/// the results die with the screen.

abstract class _$PlaceSearchNotifier
    extends $Notifier<AsyncValue<List<Place>>?> {
  AsyncValue<List<Place>>? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Place>>?, AsyncValue<List<Place>>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Place>>?, AsyncValue<List<Place>>?>,
              AsyncValue<List<Place>>?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
