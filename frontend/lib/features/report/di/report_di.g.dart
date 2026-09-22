// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reportRemoteDataSource)
final reportRemoteDataSourceProvider = ReportRemoteDataSourceProvider._();

final class ReportRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ReportRemoteDataSource,
          ReportRemoteDataSource,
          ReportRemoteDataSource
        >
    with $Provider<ReportRemoteDataSource> {
  ReportRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ReportRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReportRemoteDataSource create(Ref ref) {
    return reportRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportRemoteDataSource>(value),
    );
  }
}

String _$reportRemoteDataSourceHash() =>
    r'c1ed0cf7ecb76b230697e91a8a30b703d64ad238';

@ProviderFor(reportRepository)
final reportRepositoryProvider = ReportRepositoryProvider._();

final class ReportRepositoryProvider
    extends
        $FunctionalProvider<
          ReportRepository,
          ReportRepository,
          ReportRepository
        >
    with $Provider<ReportRepository> {
  ReportRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reportRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reportRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReportRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReportRepository create(Ref ref) {
    return reportRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReportRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReportRepository>(value),
    );
  }
}

String _$reportRepositoryHash() => r'e4a669dc986fcecb1b06c84c456fe532a13f112c';

@ProviderFor(getFeedReportsUsecase)
final getFeedReportsUsecaseProvider = GetFeedReportsUsecaseProvider._();

final class GetFeedReportsUsecaseProvider
    extends
        $FunctionalProvider<
          GetFeedReportsUsecase,
          GetFeedReportsUsecase,
          GetFeedReportsUsecase
        >
    with $Provider<GetFeedReportsUsecase> {
  GetFeedReportsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFeedReportsUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFeedReportsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetFeedReportsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetFeedReportsUsecase create(Ref ref) {
    return getFeedReportsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetFeedReportsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetFeedReportsUsecase>(value),
    );
  }
}

String _$getFeedReportsUsecaseHash() =>
    r'24835f6e2dade484c6867b55d8fbe83ad4506b98';

@ProviderFor(getMyReportsUsecase)
final getMyReportsUsecaseProvider = GetMyReportsUsecaseProvider._();

final class GetMyReportsUsecaseProvider
    extends
        $FunctionalProvider<
          GetMyReportsUsecase,
          GetMyReportsUsecase,
          GetMyReportsUsecase
        >
    with $Provider<GetMyReportsUsecase> {
  GetMyReportsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMyReportsUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMyReportsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetMyReportsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMyReportsUsecase create(Ref ref) {
    return getMyReportsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMyReportsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMyReportsUsecase>(value),
    );
  }
}

String _$getMyReportsUsecaseHash() =>
    r'57cdfc6ee067f60a5625e53dfc2a8840321ef1ab';
