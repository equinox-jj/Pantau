import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/enums/enums.dart';

part 'status_history_entry.freezed.dart';

/// One immutable status transition on a report. The API exposes the actor's
/// role, never their identity.
@freezed
abstract class StatusHistoryEntry with _$StatusHistoryEntry {
  const factory StatusHistoryEntry({
    String? id,

    /// Null on the initial entry.
    ReportStatus? fromStatus,
    @Default(ReportStatus.unknown) ReportStatus toStatus,
    String? note,
    String? actorRole,
    DateTime? createdAt,
  }) = _StatusHistoryEntry;
}
