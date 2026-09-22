// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The feed tab: which segment is selected, and the nearby segment's
/// location-driven fetch.
///
/// Distance is resolved here rather than in a derived provider because the
/// origin is the very position this fetch used — pairing them anywhere else
/// risks measuring against a newer fix than the list was loaded for.

@ProviderFor(FeedNotifier)
final feedProvider = FeedNotifierProvider._();

/// The feed tab: which segment is selected, and the nearby segment's
/// location-driven fetch.
///
/// Distance is resolved here rather than in a derived provider because the
/// origin is the very position this fetch used — pairing them anywhere else
/// risks measuring against a newer fix than the list was loaded for.
final class FeedNotifierProvider
    extends $NotifierProvider<FeedNotifier, FeedPageState> {
  /// The feed tab: which segment is selected, and the nearby segment's
  /// location-driven fetch.
  ///
  /// Distance is resolved here rather than in a derived provider because the
  /// origin is the very position this fetch used — pairing them anywhere else
  /// risks measuring against a newer fix than the list was loaded for.
  FeedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'feedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$feedNotifierHash();

  @$internal
  @override
  FeedNotifier create() => FeedNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedPageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedPageState>(value),
    );
  }
}

String _$feedNotifierHash() => r'457967bf51c41bc81099269a4077b0f8e1874a09';

/// The feed tab: which segment is selected, and the nearby segment's
/// location-driven fetch.
///
/// Distance is resolved here rather than in a derived provider because the
/// origin is the very position this fetch used — pairing them anywhere else
/// risks measuring against a newer fix than the list was loaded for.

abstract class _$FeedNotifier extends $Notifier<FeedPageState> {
  FeedPageState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<FeedPageState, FeedPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FeedPageState, FeedPageState>,
              FeedPageState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
