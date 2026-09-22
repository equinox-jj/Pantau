import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../../../../core/utils/enums/enums.dart';
import '../entity/entity.dart';

abstract class MapRepository with BaseRepository {
  Future<Either<Failure, List<NearbyReport>>> getNearbyReports({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit,
  });

  Future<Either<Failure, List<ReportCategory>>> getReportCategories();

  Future<Either<Failure, ReportDetail>> getReportDetail(String id);

  Future<Either<Failure, List<StatusHistoryEntry>>> getReportHistory(String id);

  /// Creates a report, uploading the photos at [photoPaths] (1-4 images) in
  /// the same request.
  Future<Either<Failure, ReportDetail>> createReport({
    required int categoryId,
    required String description,
    required List<String> photoPaths,
    required double latitude,
    required double longitude,
  });

  /// Advances a report's status. Resolver-only server-side — a non-resolver
  /// token gets a 403, surfaced as a [Failure] like any other call.
  Future<Either<Failure, ReportDetail>> updateReportStatus({
    required String id,
    required ReportStatus toStatus,
    String? note,
  });
}
