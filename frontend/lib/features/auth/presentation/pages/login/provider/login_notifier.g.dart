// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginUser)
final loginUserProvider = LoginUserProvider._();

final class LoginUserProvider
    extends $NotifierProvider<LoginUser, AsyncValue<Login?>> {
  LoginUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUserHash();

  @$internal
  @override
  LoginUser create() => LoginUser();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Login?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Login?>>(value),
    );
  }
}

String _$loginUserHash() => r'ded468e4085875f76a3b2de598c2371693833bce';

abstract class _$LoginUser extends $Notifier<AsyncValue<Login?>> {
  AsyncValue<Login?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Login?>, AsyncValue<Login?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Login?>, AsyncValue<Login?>>,
              AsyncValue<Login?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
