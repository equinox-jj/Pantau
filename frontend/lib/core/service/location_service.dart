import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart' as permissions;

/// Outcome of a location request. Sealed so callers must handle every
/// permission branch and no widget has to know about geolocator's enums.
sealed class LocationResult {
  const LocationResult();
}

/// A fix was obtained.
class LocationSuccess extends LocationResult {
  const LocationSuccess({
    required this.latitude,
    required this.longitude,
    required this.accuracyInMeters,
  });

  final double latitude;
  final double longitude;

  /// Radius of the 68% confidence circle reported by the platform. Shown next
  /// to a pin the user has not moved yet; meaningless once they drag it.
  final double accuracyInMeters;
}

/// Device location services (GPS) are switched off.
class LocationServiceDisabled extends LocationResult {
  const LocationServiceDisabled();
}

/// The user declined the permission prompt this time.
class LocationPermissionDenied extends LocationResult {
  const LocationPermissionDenied();
}

/// The user declined permanently — only app settings can grant it now.
class LocationPermissionDeniedForever extends LocationResult {
  const LocationPermissionDeniedForever();
}

/// Permission was granted but the fix failed (timeout, hardware error).
class LocationFailed extends LocationResult {
  const LocationFailed({this.debugDetail});

  /// Fixed, user-facing copy. The underlying exception can be a raw
  /// platform message (e.g. a [TimeoutException] string), so it is never
  /// safe to render directly.
  static const message = 'Could not get your location. Try again.';

  /// Underlying exception detail, for logging/debugging only — never shown
  /// to the user.
  final String? debugDetail;
}

/// Device location capability. Domain and presentation depend on this
/// abstraction, never on geolocator directly.
abstract interface class LocationService {
  /// Requests permission if needed and returns the current position.
  Future<LocationResult> getCurrentLocation();

  /// Opens the OS app-settings page so a permanent denial can be reversed.
  Future<void> openSettings();
}

/// [LocationService] backed by geolocator + permission_handler.
class GeolocatorLocationService implements LocationService {
  const GeolocatorLocationService();

  static const _settings = LocationSettings(
    accuracy: LocationAccuracy.high,
    timeLimit: Duration(seconds: 20),
  );

  @override
  Future<LocationResult> getCurrentLocation() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        return const LocationServiceDisabled();
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        return const LocationPermissionDeniedForever();
      }
      if (permission == LocationPermission.denied) {
        return const LocationPermissionDenied();
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: _settings,
      );

      return LocationSuccess(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracyInMeters: position.accuracy,
      );
    } catch (e) {
      return LocationFailed(debugDetail: e.toString());
    }
  }

  @override
  Future<void> openSettings() => permissions.openAppSettings();
}
