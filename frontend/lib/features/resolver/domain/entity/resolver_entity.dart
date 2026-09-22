import '../../../../core/utils/enums/enums.dart';

/// One report waiting in a resolver's queue.
///
/// Category is flattened to an id/name pair, same convention as the citizen
/// feed's `FeedReport` — the card only ever renders the label.
class QueueReport {
  const QueueReport({
    this.id,
    this.categoryId,
    this.categoryName,
    this.status = ReportStatus.unknown,
    this.description,
    this.photoUrl,
    this.latitude,
    this.longitude,
    this.distanceMeter,
    this.createdAt,
  });

  final String? id;
  final int? categoryId;
  final String? categoryName;
  final ReportStatus status;
  final String? description;
  final String? photoUrl;
  final double? latitude;
  final double? longitude;

  /// Straight from the API — the resolver's own position is the query
  /// origin, so unlike the citizen feed there is nothing to compute here.
  final double? distanceMeter;
  final DateTime? createdAt;
}

/// Row counts per [QueueTab], returned with every `/queue` response
/// regardless of which tab was requested.
class QueueCounts {
  const QueueCounts({this.open = 0, this.inProgress = 0, this.resolved = 0});

  final int open;
  final int inProgress;
  final int resolved;
}

/// One page of the queue: the rows plus whether another page follows.
class QueueResult {
  const QueueResult({
    required this.items,
    required this.counts,
    required this.hasNext,
  });

  final List<QueueReport> items;
  final QueueCounts counts;
  final bool hasNext;
}
