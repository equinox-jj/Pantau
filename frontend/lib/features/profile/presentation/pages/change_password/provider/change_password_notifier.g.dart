// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// `AsyncData(true)` means the password was changed and the listener may
/// sign the user out so they log in again with the new password.

@ProviderFor(ChangePassword)
final changePasswordProvider = ChangePasswordProvider._();

/// `AsyncData(true)` means the password was changed and the listener may
/// sign the user out so they log in again with the new password.
final class ChangePasswordProvider
    extends $NotifierProvider<ChangePassword, AsyncValue<bool>> {
  /// `AsyncData(true)` means the password was changed and the listener may
  /// sign the user out so they log in again with the new password.
  ChangePasswordProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'changePasswordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$changePasswordHash();

  @$internal
  @override
  ChangePassword create() => ChangePassword();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<bool> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<bool>>(value),
    );
  }
}

String _$changePasswordHash() => r'1e9cb397173bfdbd16b4b5b3dd5e47ef061f1738';

/// `AsyncData(true)` means the password was changed and the listener may
/// sign the user out so they log in again with the new password.

abstract class _$ChangePassword extends $Notifier<AsyncValue<bool>> {
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
