import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import 'package:pantau/core/base/base.dart';
import 'package:pantau/core/error/error.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/domain/repository/repository.dart';

class ReverseGeocodeParams extends Equatable {
  const ReverseGeocodeParams({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [latitude, longitude];
}

/// Names the coordinate a pin sits on, so the compose flow can show a street
/// instead of two decimals.
class ReverseGeocodeUsecase extends UseCase<Place?, ReverseGeocodeParams> {
  ReverseGeocodeUsecase({required this._placeRepository});

  final PlaceRepository _placeRepository;

  @override
  Future<Either<Failure, Place?>> call(ReverseGeocodeParams params) =>
      _placeRepository.reverseGeocode(
        latitude: params.latitude,
        longitude: params.longitude,
      );
}
