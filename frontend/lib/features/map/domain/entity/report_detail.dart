import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/features/map/domain/entity/report_category.dart';

part 'report_detail.freezed.dart';

/// Full report payload. Also the result of creating a report — the create and
/// detail responses are structurally identical.
@freezed
abstract class ReportDetail with _$ReportDetail {
  const factory ReportDetail({
    String? id,
    ReportCategory? category,
    String? description,
    @Default(<String>[]) List<String> photoUrls,
    double? latitude,
    double? longitude,
    @Default(ReportStatus.unknown) ReportStatus status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ReportDetail;
}
