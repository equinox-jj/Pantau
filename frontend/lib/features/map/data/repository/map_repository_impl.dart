import 'package:fpdart/fpdart.dart';

import '../../../../core/error/error.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../domain/entity/entity.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasources.dart';
import '../mapper/mapper.dart';

class MapRepositoryImpl extends MapRepository implements PlaceRepository {
  MapRepositoryImpl({required this._mapRemoteDataSource});

  final MapRemoteDataSource _mapRemoteDataSource;

  @override
  Future<Either<Failure, List<NearbyReport>>> getNearbyReports({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit = 10,
  }) => safeCall(() async {
    final result = await _mapRemoteDataSource.getNearbyReports(
      latitude: latitude,
      longitude: longitude,
      radiusInMeters: radiusInMeters,
      limit: limit,
    );

    return result.toEntities();
  });

  @override
  Future<Either<Failure, List<ReportCategory>>> getReportCategories() =>
      safeCall(() async {
        final result = await _mapRemoteDataSource.getReportCategories();

        return result.toEntities();
      });

  @override
  Future<Either<Failure, ReportDetail>> getReportDetail(String id) =>
      safeCall(() async {
        final result = await _mapRemoteDataSource.getReportDetail(id);

        return result.toEntity();
      });

  @override
  Future<Either<Failure, List<StatusHistoryEntry>>> getReportHistory(
    String id,
  ) => safeCall(() async {
    final result = await _mapRemoteDataSource.getReportHistory(id);

    return result.toEntities();
  });

  @override
  Future<Either<Failure, ReportDetail>> createReport({
    required int categoryId,
    required String description,
    required List<String> photoPaths,
    required double latitude,
    required double longitude,
  }) => safeCall(() async {
    final result = await _mapRemoteDataSource.createReport(
      categoryId: categoryId,
      description: description,
      photoPaths: photoPaths,
      latitude: latitude,
      longitude: longitude,
    );

    return result.toEntity();
  });

  @override
  Future<Either<Failure, ReportDetail>> updateReportStatus({
    required String id,
    required ReportStatus toStatus,
    String? note,
  }) => safeCall(() async {
    final result = await _mapRemoteDataSource.updateReportStatus(
      id: id,
      toStatus: toStatus.toStatusValue,
      note: note,
    );

    return result.toEntity();
  });

  @override
  Future<Either<Failure, List<Place>>> searchPlaces({
    required String query,
    PlaceViewBox? viewBox,
    int limit = 6,
  }) => safeCall(() async {
    final result = await _mapRemoteDataSource.searchPlaces(
      query: query,
      viewBox: viewBox == null ? null : _formatViewBox(viewBox),
      limit: limit,
    );

    return result.toEntities();
  });

  @override
  Future<Either<Failure, Place?>> reverseGeocode({
    required double latitude,
    required double longitude,
  }) => safeCall(() async {
    final result = await _mapRemoteDataSource.reverseGeocode(
      latitude: latitude,
      longitude: longitude,
    );

    return result?.toEntity();
  });

  /// Nominatim expects `minLon,minLat,maxLon,maxLat` — longitude first, which
  /// is the reverse of how the rest of the app orders coordinates.
  String _formatViewBox(PlaceViewBox viewBox) {
    return '${viewBox.minLongitude},${viewBox.minLatitude},'
        '${viewBox.maxLongitude},${viewBox.maxLatitude}';
  }
}
