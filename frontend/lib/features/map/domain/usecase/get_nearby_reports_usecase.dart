import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';

class GetNearbyReportsParams extends Equatable {
  const GetNearbyReportsParams({
    required this.latitude,
    required this.longitude,
    required this.radiusInMeters,
    this.limit = 10,
  });

  final double latitude;
  final double longitude;
  final int radiusInMeters;
  final int limit;

  @override
  List<Object?> get props => [latitude, longitude, radiusInMeters, limit];
}

class GetNearbyReportsUsecase
    extends UseCase<List<NearbyReport>, GetNearbyReportsParams> {
  GetNearbyReportsUsecase({required this._mapRepository});

  final MapRepository _mapRepository;

  @override
  Future<Either<Failure, List<NearbyReport>>> call(
    GetNearbyReportsParams params,
  ) => _mapRepository.getNearbyReports(
    latitude: params.latitude,
    longitude: params.longitude,
    radiusInMeters: params.radiusInMeters,
    limit: params.limit,
  );
}
