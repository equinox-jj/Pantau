import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/helpers/helpers.dart';
import '../../domain/entity/entity.dart';
import '../model/model.dart';

extension NearbyReportsModelMapper on NearbyReportsModel {
  List<NearbyReport> toEntities() =>
      data?.map((e) => e.toEntity()).toList() ?? const [];
}

extension NearbyReportsDataModelMapper on NearbyReportsDataModel {
  NearbyReport toEntity() {
    return NearbyReport(
      id: id,
      category: category?.toEntity(),
      status: ReportStatus.fromSlug(status),
      photoUrl: photoUrls?.firstOrNull,
      latitude: latitude,
      longitude: longitude,
      createdAt: parseDate(createdAt),
    );
  }
}

extension NearbyReportsCategoryModelMapper on NearbyReportsCategoryModel {
  ReportCategory toEntity() {
    return ReportCategory(id: id, name: name, slug: slug, isActive: isActive);
  }
}
