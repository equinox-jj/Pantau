import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/helpers/helpers.dart';
import '../../domain/entity/resolver_entity.dart';
import '../model/resolver_model.dart';

extension QueueModelMapper on QueueModel {
  QueueResult toEntity() {
    final items =
        data?.items?.map((e) => e.toEntity()).toList(growable: false) ??
        const <QueueReport>[];

    return QueueResult(
      items: items,
      counts: data?.counts?.toEntity() ?? const QueueCounts(),
      hasNext: data?.meta?.hasNext ?? false,
    );
  }
}

extension QueueReportDataModelMapper on QueueReportDataModel {
  QueueReport toEntity() {
    return QueueReport(
      id: id,
      categoryId: category?.id,
      categoryName: category?.name,
      status: ReportStatus.fromSlug(status),
      description: description,
      photoUrl: photoUrls?.firstOrNull,
      latitude: latitude,
      longitude: longitude,
      distanceMeter: distanceMeter,
      createdAt: parseDate(createdAt),
    );
  }
}

extension QueueCountsModelMapper on QueueCountsModel {
  QueueCounts toEntity() {
    return QueueCounts(
      open: open ?? 0,
      inProgress: inProgress ?? 0,
      resolved: resolved ?? 0,
    );
  }
}
