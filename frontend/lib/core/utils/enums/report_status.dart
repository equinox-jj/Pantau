/// Lifecycle of a report, shared by the map, feed, my-reports and resolver
/// surfaces. Mirrors the backend `report_status` enum.
enum ReportStatus {
  reported('reported', 'Reported'),
  acknowledged('acknowledged', 'Acknowledged'),
  inProgress('in_progress', 'In progress'),
  resolved('resolved', 'Resolved'),
  closed('closed', 'Closed'),
  rejected('rejected', 'Rejected'),

  /// Fallback for a server status this build does not know yet.
  unknown('unknown', 'Unknown');

  const ReportStatus(this.slug, this.label);

  /// Wire value used by the API.
  final String slug;

  /// Always rendered next to the status colour.
  final String label;

  /// Wire value for the `to_status` field on the status-update PATCH — the
  /// API expects this one upper case (`ACKNOWLEDGED`), unlike every other
  /// place [slug] is used.
  String get toStatusValue => slug.toUpperCase();

  /// Parses a wire value, falling back to [ReportStatus.unknown].
  static ReportStatus fromSlug(String? slug) {
    if (slug == null) return ReportStatus.unknown;
    final normalized = slug.trim().toLowerCase();

    for (final status in ReportStatus.values) {
      if (status.slug == normalized) return status;
    }

    return ReportStatus.unknown;
  }
}
