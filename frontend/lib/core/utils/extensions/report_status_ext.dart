import 'package:material_ui/material_ui.dart';

import '../../theme/theme.dart';
import '../enums/enums.dart';

/// Maps a [ReportStatus] onto the design system's status colour tokens.
///
/// Colour never carries meaning alone: every consumer pairs [color] with
/// [ReportStatus.label] and [icon] (NFR-8).
extension ReportStatusX on ReportStatus {
  /// Marker/chip fill.
  Color get color => switch (this) {
    ReportStatus.reported => AppColors.statusReported,
    ReportStatus.acknowledged => AppColors.statusAcknowledged,
    ReportStatus.inProgress => AppColors.statusInProgress,
    ReportStatus.resolved => AppColors.statusResolved,
    ReportStatus.closed => AppColors.statusClosed,
    ReportStatus.rejected => AppColors.statusRejected,
    ReportStatus.unknown => AppColors.statusClosed,
  };

  /// Contrasts against [color].
  Color get inkColor => switch (this) {
    ReportStatus.reported => AppColors.statusReportedInk,
    ReportStatus.acknowledged => AppColors.statusAcknowledgedInk,
    ReportStatus.inProgress => AppColors.statusInProgressInk,
    ReportStatus.resolved => AppColors.statusResolvedInk,
    ReportStatus.closed => AppColors.statusClosedInk,
    ReportStatus.rejected => AppColors.statusRejectedInk,
    ReportStatus.unknown => AppColors.statusClosedInk,
  };

  /// Shown beside the label so the state reads without colour.
  IconData get icon => switch (this) {
    ReportStatus.reported => Icons.report_gmailerrorred,
    ReportStatus.acknowledged => Icons.visibility_outlined,
    ReportStatus.inProgress => Icons.construction_outlined,
    ReportStatus.resolved => Icons.check_circle_outline,
    ReportStatus.closed => Icons.archive_outlined,
    ReportStatus.rejected => Icons.cancel_outlined,
    ReportStatus.unknown => Icons.help_outline,
  };
}
