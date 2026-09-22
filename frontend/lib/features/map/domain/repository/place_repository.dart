import 'package:fpdart/fpdart.dart';

import '../../../../core/base/base.dart';
import '../../../../core/error/error.dart';
import '../entity/entity.dart';

abstract class PlaceRepository with BaseRepository {
  /// Forward-geocodes [query], optionally biased toward [viewBox].
  Future<Either<Failure, List<Place>>> searchPlaces({
    required String query,
    PlaceViewBox? viewBox,
    int limit,
  });

  /// Reverse-geocodes a coordinate. A `null` right side means the point has no
  /// addressable feature — not a failure.
  Future<Either<Failure, Place?>> reverseGeocode({
    required double latitude,
    required double longitude,
  });
}
