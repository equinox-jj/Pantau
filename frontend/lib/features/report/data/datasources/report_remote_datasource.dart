import 'package:pantau/core/base/base.dart';
import 'package:pantau/features/report/data/model/feed_reports_model.dart';

abstract class ReportRemoteDataSource with BaseRemoteDataSource {
  /// Reports within [radiusInMeters] of the point, nearest first.
  Future<List<FeedReportsDataModel>> getFeedReports({
    required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit,
  });

  /// The caller's own reports, newest first.
  Future<List<FeedReportsDataModel>> getMyReports({int limit, int offset});
}
