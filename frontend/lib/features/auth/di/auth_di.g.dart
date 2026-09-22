// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRemoteDataSource)
final authRemoteDataSourceProvider = AuthRemoteDataSourceProvider._();

final class AuthRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          AuthRemoteDataSource,
          AuthRemoteDataSource,
          AuthRemoteDataSource
        >
    with $Provider<AuthRemoteDataSource> {
  AuthRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<AuthRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRemoteDataSource create(Ref ref) {
    return authRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemoteDataSource>(value),
    );
  }
}

String _$authRemoteDataSourceHash() =>
    r'83759467bf61c03cf433b26d1126b19ab1d2b493';

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'7eaba8d197640058b8e5414d9301ba31a5807b68';

@ProviderFor(loginUsecase)
final loginUsecaseProvider = LoginUsecaseProvider._();

final class LoginUsecaseProvider
    extends $FunctionalProvider<LoginUsecase, LoginUsecase, LoginUsecase>
    with $Provider<LoginUsecase> {
  LoginUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginUsecaseHash();

  @$internal
  @override
  $ProviderElement<LoginUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoginUsecase create(Ref ref) {
    return loginUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoginUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoginUsecase>(value),
    );
  }
}

String _$loginUsecaseHash() => r'f62760df14c3e853f959fc5c11504bc3684436e8';

@ProviderFor(logoutUsecase)
final logoutUsecaseProvider = LogoutUsecaseProvider._();

final class LogoutUsecaseProvider
    extends $FunctionalProvider<LogoutUsecase, LogoutUsecase, LogoutUsecase>
    with $Provider<LogoutUsecase> {
  LogoutUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logoutUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logoutUsecaseHash();

  @$internal
  @override
  $ProviderElement<LogoutUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogoutUsecase create(Ref ref) {
    return logoutUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogoutUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogoutUsecase>(value),
    );
  }
}

String _$logoutUsecaseHash() => r'389267b6db4e22e721261c34c6a6a3c4b183181a';

@ProviderFor(registerUsecase)
final registerUsecaseProvider = RegisterUsecaseProvider._();

final class RegisterUsecaseProvider
    extends
        $FunctionalProvider<RegisterUsecase, RegisterUsecase, RegisterUsecase>
    with $Provider<RegisterUsecase> {
  RegisterUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerUsecaseHash();

  @$internal
  @override
  $ProviderElement<RegisterUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RegisterUsecase create(Ref ref) {
    return registerUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterUsecase>(value),
    );
  }
}

String _$registerUsecaseHash() => r'f6d2f7e2cb633d1332fa8dc1f559adc0c943abe0';

@ProviderFor(getCurrentUserUsecase)
final getCurrentUserUsecaseProvider = GetCurrentUserUsecaseProvider._();

final class GetCurrentUserUsecaseProvider
    extends
        $FunctionalProvider<
          GetCurrentUserUsecase,
          GetCurrentUserUsecase,
          GetCurrentUserUsecase
        >
    with $Provider<GetCurrentUserUsecase> {
  GetCurrentUserUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCurrentUserUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCurrentUserUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetCurrentUserUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCurrentUserUsecase create(Ref ref) {
    return getCurrentUserUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCurrentUserUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCurrentUserUsecase>(value),
    );
  }
}

String _$getCurrentUserUsecaseHash() =>
    r'c22f820f5c872a838b14353a8b1e3ab4fea3ff3e';

@ProviderFor(getCachedRoleUsecase)
final getCachedRoleUsecaseProvider = GetCachedRoleUsecaseProvider._();

final class GetCachedRoleUsecaseProvider
    extends
        $FunctionalProvider<
          GetCachedRoleUsecase,
          GetCachedRoleUsecase,
          GetCachedRoleUsecase
        >
    with $Provider<GetCachedRoleUsecase> {
  GetCachedRoleUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCachedRoleUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCachedRoleUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetCachedRoleUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCachedRoleUsecase create(Ref ref) {
    return getCachedRoleUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCachedRoleUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCachedRoleUsecase>(value),
    );
  }
}

String _$getCachedRoleUsecaseHash() =>
    r'6d66f9f8aeba2c4fd0221eedb3b37ae30646bc79';

/// The cached identity of the signed-in user. Throws the [Failure] rather
/// than folding it to `null`, so it surfaces through `AsyncError` the same
/// way every other screen in this app reads a failed call.

@ProviderFor(currentUser)
final currentUserProvider = CurrentUserProvider._();

/// The cached identity of the signed-in user. Throws the [Failure] rather
/// than folding it to `null`, so it surfaces through `AsyncError` the same
/// way every other screen in this app reads a failed call.

final class CurrentUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<CurrentUser?>,
          CurrentUser?,
          FutureOr<CurrentUser?>
        >
    with $FutureModifier<CurrentUser?>, $FutureProvider<CurrentUser?> {
  /// The cached identity of the signed-in user. Throws the [Failure] rather
  /// than folding it to `null`, so it surfaces through `AsyncError` the same
  /// way every other screen in this app reads a failed call.
  CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $FutureProviderElement<CurrentUser?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CurrentUser?> create(Ref ref) {
    return currentUser(ref);
  }
}

String _$currentUserHash() => r'032e65acf013c0cf70e01bfc4c99ce732702372e';
