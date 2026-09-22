// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Clears the stored session. `AsyncData(true)` means the sign-out landed and
/// the listener may navigate away.

@ProviderFor(Logout)
final logoutProvider = LogoutProvider._();

/// Clears the stored session. `AsyncData(true)` means the sign-out landed and
/// the listener may navigate away.
final class LogoutProvider extends $NotifierProvider<Logout, AsyncValue<bool>> {
  /// Clears the stored session. `AsyncData(true)` means the sign-out landed and
  /// the listener may navigate away.
  LogoutProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutHash();

  @$internal
  @override
  Logout create() => Logout();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<bool>>(value),
    );
  }
}

String _$logoutHash() => r'7b9c3a9256a3cdc6160b1b15c07ae77a760ca009';

/// Clears the stored session. `AsyncData(true)` means the sign-out landed and
/// the listener may navigate away.

abstract class _$Logout extends $Notifier<AsyncValue<bool>> {
  AsyncValue<bool> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, AsyncValue<bool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, AsyncValue<bool>>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
