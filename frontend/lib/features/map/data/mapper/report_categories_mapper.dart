import '../../domain/entity/entity.dart';
import '../model/model.dart';

extension ReportCategoriesModelMapper on ReportCategoriesModel {
  List<ReportCategory> toEntities() =>
      data?.map((e) => e.toEntity()).toList() ?? const [];
}

extension ReportCategoriesDataModelMapper on ReportCategoriesDataModel {
  ReportCategory toEntity() {
    return ReportCategory(id: id, name: name, slug: slug, isActive: isActive);
  }
}
