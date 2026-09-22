import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';
import '../repository/repository.dart';

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
