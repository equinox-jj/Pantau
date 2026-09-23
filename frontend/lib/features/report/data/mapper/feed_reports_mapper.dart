import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/helpers/helpers.dart';
import '../../domain/entity/entity.dart';
import '../model/model.dart';

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
