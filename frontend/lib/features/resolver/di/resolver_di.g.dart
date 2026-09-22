// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolver_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resolverRemoteDataSource)
final resolverRemoteDataSourceProvider = ResolverRemoteDataSourceProvider._();

final class ResolverRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ResolverRemoteDataSource,
          ResolverRemoteDataSource,
          ResolverRemoteDataSource
        >
    with $Provider<ResolverRemoteDataSource> {
  ResolverRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resolverRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resolverRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ResolverRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResolverRemoteDataSource create(Ref ref) {
    return resolverRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResolverRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResolverRemoteDataSource>(value),
    );
  }
}

String _$resolverRemoteDataSourceHash() =>
    r'b262b0ab786df98abdfcda0548aa02aa8f707c99';

@ProviderFor(resolverRepository)
final resolverRepositoryProvider = ResolverRepositoryProvider._();

final class ResolverRepositoryProvider
    extends
        $FunctionalProvider<
          ResolverRepository,
          ResolverRepository,
          ResolverRepository
        >
    with $Provider<ResolverRepository> {
  ResolverRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resolverRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resolverRepositoryHash();

  @$internal
  @override
  $ProviderElement<ResolverRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResolverRepository create(Ref ref) {
    return resolverRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResolverRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResolverRepository>(value),
    );
  }
}

String _$resolverRepositoryHash() =>
    r'adc3fcf54ea83ef8031a875a2c8d60f0ca9946b8';

@ProviderFor(getQueueUsecase)
final getQueueUsecaseProvider = GetQueueUsecaseProvider._();

final class GetQueueUsecaseProvider
    extends
        $FunctionalProvider<GetQueueUsecase, GetQueueUsecase, GetQueueUsecase>
    with $Provider<GetQueueUsecase> {
  GetQueueUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getQueueUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getQueueUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetQueueUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetQueueUsecase create(Ref ref) {
    return getQueueUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetQueueUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetQueueUsecase>(value),
    );
  }
}

String _$getQueueUsecaseHash() => r'6a9a475f6f966af3ecf9e828a03cfb11fee71666';
