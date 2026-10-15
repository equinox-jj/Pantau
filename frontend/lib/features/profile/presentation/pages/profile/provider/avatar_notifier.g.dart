// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Adds, replaces or removes the profile picture. On success the cached
/// [currentUserProvider] is refreshed so the identity card picks it up.

@ProviderFor(Avatar)
final avatarProvider = AvatarProvider._();

/// Adds, replaces or removes the profile picture. On success the cached
/// [currentUserProvider] is refreshed so the identity card picks it up.
final class AvatarProvider extends $NotifierProvider<Avatar, AsyncValue<void>> {
  /// Adds, replaces or removes the profile picture. On success the cached
  /// [currentUserProvider] is refreshed so the identity card picks it up.
  AvatarProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'avatarProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$avatarHash();

  @$internal
  @override
  Avatar create() => Avatar();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$avatarHash() => r'02865b41ba8a04bb9899e7906481e37d79dbd81b';

/// Adds, replaces or removes the profile picture. On success the cached
/// [currentUserProvider] is refreshed so the identity card picks it up.

abstract class _$Avatar extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
