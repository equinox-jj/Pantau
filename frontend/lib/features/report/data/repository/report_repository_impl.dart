import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/report/domain/entity/feed_report.dart';
import 'package:pantau/features/report/domain/repository/report_repository.dart';
import 'package:pantau/features/report/data/datasources/report_remote_datasource.dart';
import 'package:pantau/features/report/data/mapper/feed_reports_mapper.dart';

class ReportRepositoryImpl extends ReportRepository {
  ReportRepositoryImpl({required this._reportRemoteDataSource});

  final ReportRemoteDataSource _reportRemoteDataSource;

  @override
  Future<Either<Failure, List<FeedReport>>> getFeedReports({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit = 50,
  }) => safeCall(() async {
    final result = await _reportRemoteDataSource.getFeedReports(
      latitude: latitude,
      longitude: longitude,
      radiusInMeters: radiusInMeters,
      limit: limit,
    );

    return result.toEntities();
  });

  @override
  Future<Either<Failure, List<FeedReport>>> getMyReports({
    int limit = 50,
    int offset = 0,
  }) => safeCall(() async {
    final result = await _reportRemoteDataSource.getMyReports(
      limit: limit,
      offset: offset,
    );

    return result.toEntities();
  });
}
