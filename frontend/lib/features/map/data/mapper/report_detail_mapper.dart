import 'package:pantau/core/utils/enums/enums.dart';
import 'package:pantau/core/utils/helpers/helpers.dart';
import 'package:pantau/features/map/domain/entity/entity.dart';
import 'package:pantau/features/map/data/model/model.dart';

extension ReportDetailModelMapper on ReportDetailModel {
  ReportDetail toEntity() {
    return ReportDetail(
      id: id,
      category: category?.toEntity(),
      description: description,
      photoUrls: photoUrls ?? const [],
      latitude: latitude,
      longitude: longitude,
      status: ReportStatus.fromSlug(status),
      createdAt: parseDate(createdAt),
      updatedAt: parseDate(updatedAt),
    );
  }
}

extension ReportDetailCategoryModelMapper on ReportDetailCategoryModel {
  ReportCategory toEntity() {
    return ReportCategory(id: id, name: name, slug: slug, isActive: isActive);
  }
}
