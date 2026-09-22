import '../../../../core/error/error.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/helpers/helpers.dart';
import '../../domain/entity/entity.dart';
import '../model/model.dart';

extension ReportDetailModelMapper on ReportDetailModel {
  ReportDetail toEntity() {
    final data = this.data;
    if (data == null) {
      throw const NotFoundException('Report not found');
    }

    return data.toEntity();
  }
}

extension ReportDetailDataModelMapper on ReportDetailDataModel {
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
