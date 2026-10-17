import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/report/domain/entity/feed_report.dart';
import 'package:pantau/features/report/domain/repository/report_repository.dart';

class GetFeedReportsParams extends Equatable {
  const GetFeedReportsParams({
    required this.latitude,
    required this.longitude,
    required this.radiusInMeters,
    this.limit = 50,
  });

  final double latitude;
  final double longitude;
  final int radiusInMeters;
  final int limit;

  @override
  List<Object?> get props => [latitude, longitude, radiusInMeters, limit];
}

class GetFeedReportsUsecase
    extends UseCase<List<FeedReport>, GetFeedReportsParams> {
  GetFeedReportsUsecase({required this._reportRepository});

  final ReportRepository _reportRepository;

  @override
  Future<Either<Failure, List<FeedReport>>> call(GetFeedReportsParams params) =>
      _reportRepository.getFeedReports(
        latitude: params.latitude,
        longitude: params.longitude,
        radiusInMeters: params.radiusInMeters,
        limit: params.limit,
      );
}
