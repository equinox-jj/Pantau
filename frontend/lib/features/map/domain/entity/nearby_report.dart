import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/enums/enums.dart';
import 'report_category.dart';

part 'nearby_report.freezed.dart';

/// A single marker on the nearby map. Coordinates stay plain doubles so the
/// domain never depends on a map package's `LatLng`.
@freezed
abstract class NearbyReport with _$NearbyReport {
  const factory NearbyReport({
    String? id,
    ReportCategory? category,
    @Default(ReportStatus.unknown) ReportStatus status,
    String? photoUrl,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
  }) = _NearbyReport;
}
