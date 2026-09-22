import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';

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
