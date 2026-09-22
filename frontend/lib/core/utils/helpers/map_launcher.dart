import 'package:url_launcher/url_launcher.dart';

/// Opens the device's default maps app centred on [latitude]/[longitude]
/// via the standard `geo:` intent scheme. Returns `false` (rather than
/// throwing) when no app can handle it, so the caller can show its own
/// snackbar instead of an uncaught platform exception.
Future<bool> openMapsDirections(double latitude, double longitude) {
  final uri = Uri.parse('geo:$latitude,$longitude?q=$latitude,$longitude');

  return launchUrl(uri, mode: LaunchMode.externalApplication);
}
