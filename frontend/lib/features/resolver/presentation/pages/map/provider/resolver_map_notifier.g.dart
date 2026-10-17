// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolver_map_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ResolverMapNotifier)
final resolverMapProvider = ResolverMapNotifierProvider._();

final class ResolverMapNotifierProvider
    extends $NotifierProvider<ResolverMapNotifier, ResolverMapPageState> {
  ResolverMapNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resolverMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resolverMapNotifierHash();

  @$internal
  @override
  ResolverMapNotifier create() => ResolverMapNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResolverMapPageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResolverMapPageState>(value),
    );
  }
}

String _$resolverMapNotifierHash() =>
    r'c17d7769a0423a69744caea985b13a07a1f55ab5';

abstract class _$ResolverMapNotifier extends $Notifier<ResolverMapPageState> {
  ResolverMapPageState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ResolverMapPageState, ResolverMapPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ResolverMapPageState, ResolverMapPageState>,
              ResolverMapPageState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
