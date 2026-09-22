import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/di/core_di.dart';
import '../data/datasources/datasources.dart';
import '../data/repository/repository.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/usecase.dart';

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
    mapRepository: ref.read(mapRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetReportCategoriesUsecase getReportCategoriesUsecase(Ref ref) {
  return GetReportCategoriesUsecase(
    mapRepository: ref.read(mapRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetReportDetailUsecase getReportDetailUsecase(Ref ref) {
  return GetReportDetailUsecase(mapRepository: ref.read(mapRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetReportHistoryUsecase getReportHistoryUsecase(Ref ref) {
  return GetReportHistoryUsecase(
    mapRepository: ref.read(mapRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
CreateReportUsecase createReportUsecase(Ref ref) {
  return CreateReportUsecase(mapRepository: ref.read(mapRepositoryProvider));
}

@Riverpod(keepAlive: true)
UpdateReportStatusUsecase updateReportStatusUsecase(Ref ref) {
  return UpdateReportStatusUsecase(
    mapRepository: ref.read(mapRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
SearchPlacesUsecase searchPlacesUsecase(Ref ref) {
  return SearchPlacesUsecase(
    placeRepository: ref.read(placeRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
ReverseGeocodeUsecase reverseGeocodeUsecase(Ref ref) {
  return ReverseGeocodeUsecase(
    placeRepository: ref.read(placeRepositoryProvider),
  );
}
