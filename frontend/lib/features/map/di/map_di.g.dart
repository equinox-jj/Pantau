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
    r'2ea3db41d741de7072bb795516cd3296aa522a4e';

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
    r'814e47905040f20907f4d992e2c9a5ca73ff7013';

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
    r'a70c692af8d3f660af2dc0d4642e1661002b54bf';

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
    r'3a8b917ba75768ab43dd7cefd9f8f3e5614a0f2d';

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
    r'abb1712c0eb53fa2ca968a8b4d1cb4a27638b2e4';

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
    r'a0dfd1c968bd02e0e2ed6d2802d8942662a1fcb4';

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
    r'379fc717f8b1bc228edb63fa272ba65b3763f0c2';

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
    r'794319433683b1721e75061fb1ce4f4705759798';
