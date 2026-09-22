import 'package:latlong2/latlong.dart';

const Distance _distance = Distance();

/// Great-circle distance in metres between two WGS84 points.
///
/// Keeps `latlong2` out of the callers, so a feature only deals in plain
/// doubles.
double distanceInMetersBetween({
  required double startLatitude,
  required double startLongitude,
  required double endLatitude,
  required double endLongitude,
}) {
  return _distance.as(
    LengthUnit.Meter,
    LatLng(startLatitude, startLongitude),
    LatLng(endLatitude, endLongitude),
  );
}
