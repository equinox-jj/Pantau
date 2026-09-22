// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The active tab's queue, newest fetch wins.
///
/// Switching tabs calls [load] again rather than keeping three lists cached
/// — every response already carries fresh counts for all three tabs, so the
/// tab counts stay in sync across switches even though the list itself
/// refetches. Three parallel cached lists would be unnecessary complexity for
/// a first version.

@ProviderFor(QueueNotifier)
final queueProvider = QueueNotifierProvider._();

/// The active tab's queue, newest fetch wins.
///
/// Switching tabs calls [load] again rather than keeping three lists cached
/// — every response already carries fresh counts for all three tabs, so the
/// tab counts stay in sync across switches even though the list itself
/// refetches. Three parallel cached lists would be unnecessary complexity for
/// a first version.
final class QueueNotifierProvider
    extends $NotifierProvider<QueueNotifier, QueuePageState> {
  /// The active tab's queue, newest fetch wins.
  ///
  /// Switching tabs calls [load] again rather than keeping three lists cached
  /// — every response already carries fresh counts for all three tabs, so the
  /// tab counts stay in sync across switches even though the list itself
  /// refetches. Three parallel cached lists would be unnecessary complexity for
  /// a first version.
  QueueNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueNotifierHash();

  @$internal
  @override
  QueueNotifier create() => QueueNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueuePageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueuePageState>(value),
    );
  }
}

String _$queueNotifierHash() => r'6d8e2d52cf0b296c6ef51a13af2cd4b8a26b0083';

/// The active tab's queue, newest fetch wins.
///
/// Switching tabs calls [load] again rather than keeping three lists cached
/// — every response already carries fresh counts for all three tabs, so the
/// tab counts stay in sync across switches even though the list itself
/// refetches. Three parallel cached lists would be unnecessary complexity for
/// a first version.

abstract class _$QueueNotifier extends $Notifier<QueuePageState> {
  QueuePageState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<QueuePageState, QueuePageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<QueuePageState, QueuePageState>,
              QueuePageState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
