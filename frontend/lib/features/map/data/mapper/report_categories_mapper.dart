import '../../domain/entity/entity.dart';
import '../model/model.dart';

extension ReportCategoriesModelMapper on List<ReportCategoriesDataModel> {
  List<ReportCategory> toEntities() =>
      map((e) => e.toEntity()).toList(growable: false);
}

extension ReportCategoriesDataModelMapper on ReportCategoriesDataModel {
  ReportCategory toEntity() {
    return ReportCategory(id: id, name: name, slug: slug, isActive: isActive);
  }
}
