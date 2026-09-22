/// Compact distance label for cards and list rows: metres below a kilometre,
/// kilometres above it (`40 m`, `1.2 km`, `12 km`).
String formatDistance(double meters) {
  if (meters < 1000) return '${meters.round()} m';

  final kilometers = meters / 1000;

  return '${kilometers.toStringAsFixed(kilometers < 10 ? 1 : 0)} km';
}

/// Compact age label used beside a report (`now`, `2h`, `3d`, `2w`, `5mo`).
///
/// [now] is injectable so the output is deterministic when tested.
String formatShortAge(DateTime value, {DateTime? now}) {
  final elapsed = (now ?? DateTime.now()).difference(value);
  // A clock skew ahead of the device reads as "just now", never as a negative.
  if (elapsed.inMinutes < 1) return 'now';
  if (elapsed.inMinutes < 60) return '${elapsed.inMinutes}m';
  if (elapsed.inHours < 24) return '${elapsed.inHours}h';
  if (elapsed.inDays < 7) return '${elapsed.inDays}d';
  if (elapsed.inDays < 30) return '${elapsed.inDays ~/ 7}w';
  if (elapsed.inDays < 365) return '${elapsed.inDays ~/ 30}mo';

  return '${elapsed.inDays ~/ 365}y';
}

/// Sentence-shaped age used by the report detail screen (`just now`, `2h ago`,
/// `3d ago`). Wraps [formatShortAge] so both surfaces agree on the thresholds.
String formatRelativeAge(DateTime value, {DateTime? now}) {
  final age = formatShortAge(value, now: now);

  return age == 'now' ? 'just now' : '$age ago';
}

/// Coordinate pair as shown next to a pin (`-6.20880, 106.84560`). Five
/// decimals is roughly metre precision — enough to identify a spot, short
/// enough to fit one line.
String formatCoordinates(double latitude, double longitude) =>
    '${latitude.toStringAsFixed(5)}, ${longitude.toStringAsFixed(5)}';

/// Accuracy radius of a device fix (`±8 m`).
String formatAccuracy(double meters) => '±${meters.round()} m';
