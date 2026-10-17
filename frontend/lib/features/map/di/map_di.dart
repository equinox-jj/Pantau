import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:pantau/core/di/core_di.dart';
import 'package:pantau/features/map/data/datasources/map_remote_datasource.dart';
import 'package:pantau/features/map/data/datasources/map_remote_datasource_impl.dart';
import 'package:pantau/features/map/data/repository/map_repository_impl.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';
import 'package:pantau/features/map/domain/usecase/usecase.dart';

part 'map_di.g.dart';

@Riverpod(keepAlive: true)
MapRemoteDataSource mapRemoteDataSource(Ref ref) {
  final dioClient = ref.watch(dioClientProvider);

  return MapRemoteDataSourceImpl(dioClient: dioClient);
}

@Riverpod(keepAlive: true)
MapRepository mapRepository(Ref ref) {
  final mapRemoteDataSource = ref.watch(mapRemoteDataSourceProvider);

  return MapRepositoryImpl(mapRemoteDataSource: mapRemoteDataSource);
}

@Riverpod(keepAlive: true)
PlaceRepository placeRepository(Ref ref) {
  final mapRemoteDataSource = ref.watch(mapRemoteDataSourceProvider);

  return MapRepositoryImpl(mapRemoteDataSource: mapRemoteDataSource);
}

@Riverpod(keepAlive: true)
GetNearbyReportsUsecase getNearbyReportsUsecase(Ref ref) {
  return GetNearbyReportsUsecase(
    mapRepository: ref.watch(mapRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetReportCategoriesUsecase getReportCategoriesUsecase(Ref ref) {
  return GetReportCategoriesUsecase(
    mapRepository: ref.watch(mapRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetReportDetailUsecase getReportDetailUsecase(Ref ref) {
  return GetReportDetailUsecase(mapRepository: ref.watch(mapRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetReportHistoryUsecase getReportHistoryUsecase(Ref ref) {
  return GetReportHistoryUsecase(
    mapRepository: ref.watch(mapRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
CreateReportUsecase createReportUsecase(Ref ref) {
  return CreateReportUsecase(mapRepository: ref.watch(mapRepositoryProvider));
}

@Riverpod(keepAlive: true)
UpdateReportStatusUsecase updateReportStatusUsecase(Ref ref) {
  return UpdateReportStatusUsecase(
    mapRepository: ref.watch(mapRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
SearchPlacesUsecase searchPlacesUsecase(Ref ref) {
  return SearchPlacesUsecase(
    placeRepository: ref.watch(placeRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
ReverseGeocodeUsecase reverseGeocodeUsecase(Ref ref) {
  return ReverseGeocodeUsecase(
    placeRepository: ref.watch(placeRepositoryProvider),
  );
}
