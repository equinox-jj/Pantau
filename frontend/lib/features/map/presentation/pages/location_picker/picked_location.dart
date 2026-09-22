import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

/// Where a report will be filed, as chosen in the compose flow.
///
/// [accuracyInMeters] is only set while the point still is the device fix —
/// dragging the pin replaces a measured position with a chosen one, and the
/// GPS accuracy no longer describes it.
class PickedLocation extends Equatable {
  const PickedLocation({
    required this.latitude,
    required this.longitude,
    this.accuracyInMeters,
  });

  PickedLocation.fromLatLng(LatLng position, {this.accuracyInMeters})
    : latitude = position.latitude,
      longitude = position.longitude;

  final double latitude;
  final double longitude;
  final double? accuracyInMeters;

  LatLng get latLng => LatLng(latitude, longitude);

  @override
  List<Object?> get props => [latitude, longitude, accuracyInMeters];
}
