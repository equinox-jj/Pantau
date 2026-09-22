import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/enums/enums.dart';

part 'feed_report.freezed.dart';

/// One card in the nearby feed.
///
/// The category is flattened to an id/name pair rather than a nested entity:
/// the feed only ever renders the label, and a flat shape keeps this feature
/// independent of the map's taxonomy entity.
@freezed
abstract class FeedReport with _$FeedReport {
  const factory FeedReport({
    String? id,
    int? categoryId,
    String? categoryName,
    @Default(ReportStatus.unknown) ReportStatus status,
    String? description,
    @Default(<String>[]) List<String> photoUrls,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
  }) = _FeedReport;
}
