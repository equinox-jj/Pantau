import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/report/domain/entity/feed_report.dart';

abstract class ReportRepository with BaseRepository {
  Future<Either<Failure, List<FeedReport>>> getFeedReports({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit,
  });

  Future<Either<Failure, List<FeedReport>>> getMyReports({
    int limit,
    int offset,
  });
}
