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
final class AvatarProvider
    extends $NotifierProvider<Avatar, AsyncValue<AvatarChange?>> {
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
  Override overrideWithValue(AsyncValue<AvatarChange?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<AvatarChange?>>(value),
    );
  }
}

String _$avatarHash() => r'ecdb066dd90789499d7af12fda5086145f272d67';

/// Adds, replaces or removes the profile picture. On success the cached
/// [currentUserProvider] is refreshed so the identity card picks it up.

abstract class _$Avatar extends $Notifier<AsyncValue<AvatarChange?>> {
  AsyncValue<AvatarChange?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<AvatarChange?>, AsyncValue<AvatarChange?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AvatarChange?>, AsyncValue<AvatarChange?>>,
              AsyncValue<AvatarChange?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
