import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../di/di.dart';
import '../../../../domain/entity/entity.dart';
import '../../../../domain/usecase/usecase.dart';

part 'pin_address_provider.g.dart';

/// Street address of a pinned coordinate, or `null` when the point has no
/// addressable feature.
///
/// Keyed by coordinate, so a pin the user drags back to a spot they already
/// visited is answered from cache instead of another Nominatim call. Callers
/// round the key (see [roundedCoordinate]) — raw camera centres never repeat.
@riverpod
Future<Place?> pinAddress(
  Ref ref, {
  required double latitude,
  required double longitude,
}) async {
  final result = await ref.read(reverseGeocodeUsecaseProvider)(
    ReverseGeocodeParams(latitude: latitude, longitude: longitude),
  );

  return result.fold((l) => throw l, (r) => r);
}

/// Snaps a coordinate to ~1 m precision, the granularity the geocoder is
/// keyed at.
double roundedCoordinate(double value) =>
    double.parse(value.toStringAsFixed(5));
