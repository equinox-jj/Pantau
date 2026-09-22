import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/helpers/helpers.dart';
import '../../domain/entity/entity.dart';
import '../model/model.dart';

extension StatusHistoryModelMapper on StatusHistoryModel {
  /// Oldest first. Server ordering is not guaranteed, and the timeline reads
  /// top-down, so the order is enforced here rather than in the widget.
  List<StatusHistoryEntry> toEntities() {
    final entries = (data ?? const <StatusHistoryEntryModel>[])
        .map((entry) => entry.toEntity())
        .toList();

    entries.sort((left, right) {
      final leftDate = left.createdAt;
      final rightDate = right.createdAt;
      if (leftDate == null && rightDate == null) return 0;
      if (leftDate == null) return 1;
      if (rightDate == null) return -1;

      return leftDate.compareTo(rightDate);
    });

    return entries;
  }
}

extension StatusHistoryEntryModelMapper on StatusHistoryEntryModel {
  StatusHistoryEntry toEntity() {
    return StatusHistoryEntry(
      id: id,
      fromStatus: fromStatus == null ? null : ReportStatus.fromSlug(fromStatus),
      toStatus: ReportStatus.fromSlug(toStatus),
      note: note,
      actorRole: actorRole,
      createdAt: parseDate(createdAt),
    );
  }
}
