// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_di.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapRemoteDataSource)
final mapRemoteDataSourceProvider = MapRemoteDataSourceProvider._();

final class MapRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          MapRemoteDataSource,
          MapRemoteDataSource,
          MapRemoteDataSource
        >
    with $Provider<MapRemoteDataSource> {
  MapRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<MapRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MapRemoteDataSource create(Ref ref) {
    return mapRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapRemoteDataSource>(value),
    );
  }
}

String _$mapRemoteDataSourceHash() =>
    r'c6968858a70629ca433b65ce8b43cc45c93760bb';

@ProviderFor(mapRepository)
final mapRepositoryProvider = MapRepositoryProvider._();

final class MapRepositoryProvider
    extends $FunctionalProvider<MapRepository, MapRepository, MapRepository>
    with $Provider<MapRepository> {
  MapRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapRepositoryHash();

  @$internal
  @override
  $ProviderElement<MapRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapRepository create(Ref ref) {
    return mapRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapRepository>(value),
    );
  }
}

String _$mapRepositoryHash() => r'95c640a23405c4b4b2ba129b8d818fbe6f2aa6b5';

@ProviderFor(placeRepository)
final placeRepositoryProvider = PlaceRepositoryProvider._();

final class PlaceRepositoryProvider
    extends
        $FunctionalProvider<PlaceRepository, PlaceRepository, PlaceRepository>
    with $Provider<PlaceRepository> {
  PlaceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'placeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$placeRepositoryHash();

  @$internal
  @override
  $ProviderElement<PlaceRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PlaceRepository create(Ref ref) {
    return placeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaceRepository>(value),
    );
  }
}

String _$placeRepositoryHash() => r'739d1e4119316a7a6edaf7e4c45aae0c19a2509d';

@ProviderFor(getNearbyReportsUsecase)
final getNearbyReportsUsecaseProvider = GetNearbyReportsUsecaseProvider._();

final class GetNearbyReportsUsecaseProvider
    extends
        $FunctionalProvider<
          GetNearbyReportsUsecase,
          GetNearbyReportsUsecase,
          GetNearbyReportsUsecase
        >
    with $Provider<GetNearbyReportsUsecase> {
  GetNearbyReportsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getNearbyReportsUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getNearbyReportsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetNearbyReportsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetNearbyReportsUsecase create(Ref ref) {
    return getNearbyReportsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetNearbyReportsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetNearbyReportsUsecase>(value),
    );
  }
}

String _$getNearbyReportsUsecaseHash() =>
    r'fad7724e5306c864d5a7d412fa5153a783794622';

@ProviderFor(getReportCategoriesUsecase)
final getReportCategoriesUsecaseProvider =
    GetReportCategoriesUsecaseProvider._();

final class GetReportCategoriesUsecaseProvider
    extends
        $FunctionalProvider<
          GetReportCategoriesUsecase,
          GetReportCategoriesUsecase,
          GetReportCategoriesUsecase
        >
    with $Provider<GetReportCategoriesUsecase> {
  GetReportCategoriesUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getReportCategoriesUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getReportCategoriesUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetReportCategoriesUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetReportCategoriesUsecase create(Ref ref) {
    return getReportCategoriesUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetReportCategoriesUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetReportCategoriesUsecase>(value),
    );
  }
}

String _$getReportCategoriesUsecaseHash() =>
    r'4e93f2adf7512d14e89ce564c56b9f9ecb82a537';

@ProviderFor(getReportDetailUsecase)
final getReportDetailUsecaseProvider = GetReportDetailUsecaseProvider._();

final class GetReportDetailUsecaseProvider
    extends
        $FunctionalProvider<
          GetReportDetailUsecase,
          GetReportDetailUsecase,
          GetReportDetailUsecase
        >
    with $Provider<GetReportDetailUsecase> {
  GetReportDetailUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getReportDetailUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getReportDetailUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetReportDetailUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetReportDetailUsecase create(Ref ref) {
    return getReportDetailUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetReportDetailUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetReportDetailUsecase>(value),
    );
  }
}

String _$getReportDetailUsecaseHash() =>
    r'51b36a4991f0d6f77fbeac4b3ef6013f13a3915f';

@ProviderFor(getReportHistoryUsecase)
final getReportHistoryUsecaseProvider = GetReportHistoryUsecaseProvider._();

final class GetReportHistoryUsecaseProvider
    extends
        $FunctionalProvider<
          GetReportHistoryUsecase,
          GetReportHistoryUsecase,
          GetReportHistoryUsecase
        >
    with $Provider<GetReportHistoryUsecase> {
  GetReportHistoryUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getReportHistoryUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getReportHistoryUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetReportHistoryUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetReportHistoryUsecase create(Ref ref) {
    return getReportHistoryUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetReportHistoryUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetReportHistoryUsecase>(value),
    );
  }
}

String _$getReportHistoryUsecaseHash() =>
    r'725b6ffdd92a4d1b44fcf90264cb385431d2143a';

@ProviderFor(createReportUsecase)
final createReportUsecaseProvider = CreateReportUsecaseProvider._();

final class CreateReportUsecaseProvider
    extends
        $FunctionalProvider<
          CreateReportUsecase,
          CreateReportUsecase,
          CreateReportUsecase
        >
    with $Provider<CreateReportUsecase> {
  CreateReportUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createReportUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createReportUsecaseHash();

  @$internal
  @override
  $ProviderElement<CreateReportUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateReportUsecase create(Ref ref) {
    return createReportUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateReportUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateReportUsecase>(value),
    );
  }
}

String _$createReportUsecaseHash() =>
    r'4ff4cad9acea345caa2ce02a25ac145ce14cde2c';

@ProviderFor(updateReportStatusUsecase)
final updateReportStatusUsecaseProvider = UpdateReportStatusUsecaseProvider._();

final class UpdateReportStatusUsecaseProvider
    extends
        $FunctionalProvider<
          UpdateReportStatusUsecase,
          UpdateReportStatusUsecase,
          UpdateReportStatusUsecase
        >
    with $Provider<UpdateReportStatusUsecase> {
  UpdateReportStatusUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateReportStatusUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateReportStatusUsecaseHash();

  @$internal
  @override
  $ProviderElement<UpdateReportStatusUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UpdateReportStatusUsecase create(Ref ref) {
    return updateReportStatusUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UpdateReportStatusUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UpdateReportStatusUsecase>(value),
    );
  }
}

String _$updateReportStatusUsecaseHash() =>
    r'd4f47f4978ac4d755d7befc82467fdc673f6fdd9';

@ProviderFor(searchPlacesUsecase)
final searchPlacesUsecaseProvider = SearchPlacesUsecaseProvider._();

final class SearchPlacesUsecaseProvider
    extends
        $FunctionalProvider<
          SearchPlacesUsecase,
          SearchPlacesUsecase,
          SearchPlacesUsecase
        >
    with $Provider<SearchPlacesUsecase> {
  SearchPlacesUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchPlacesUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchPlacesUsecaseHash();

  @$internal
  @override
  $ProviderElement<SearchPlacesUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchPlacesUsecase create(Ref ref) {
    return searchPlacesUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchPlacesUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchPlacesUsecase>(value),
    );
  }
}

String _$searchPlacesUsecaseHash() =>
    r'5cede8743bea51a507e24b20d6b6d5cd739cc8ae';

@ProviderFor(reverseGeocodeUsecase)
final reverseGeocodeUsecaseProvider = ReverseGeocodeUsecaseProvider._();

final class ReverseGeocodeUsecaseProvider
    extends
        $FunctionalProvider<
          ReverseGeocodeUsecase,
          ReverseGeocodeUsecase,
          ReverseGeocodeUsecase
        >
    with $Provider<ReverseGeocodeUsecase> {
  ReverseGeocodeUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reverseGeocodeUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reverseGeocodeUsecaseHash();

  @$internal
  @override
  $ProviderElement<ReverseGeocodeUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReverseGeocodeUsecase create(Ref ref) {
    return reverseGeocodeUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReverseGeocodeUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReverseGeocodeUsecase>(value),
    );
  }
}

String _$reverseGeocodeUsecaseHash() =>
    r'8a0e52623059f3a4d72a991f9245f0af4b3b190f';
