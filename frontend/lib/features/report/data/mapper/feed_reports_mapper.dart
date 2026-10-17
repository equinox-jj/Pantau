import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/core/utils/helpers/helpers.dart';
import 'package:pantau/features/report/domain/entity/feed_report.dart';
import 'package:pantau/features/report/data/model/feed_reports_model.dart';

extension FeedReportsModelMapper on List<FeedReportsDataModel> {
  List<FeedReport> toEntities() =>
      map((e) => e.toEntity()).toList(growable: false);
}

extension FeedReportsDataModelMapper on FeedReportsDataModel {
  FeedReport toEntity() {
    return FeedReport(
      id: id,
      categoryId: category?.id,
      categoryName: category?.name,
      status: ReportStatus.fromSlug(status),
      description: description,
      photoUrls: photoUrls ?? const [],
      latitude: latitude,
      longitude: longitude,
      createdAt: parseDate(createdAt),
    );
  }
}
