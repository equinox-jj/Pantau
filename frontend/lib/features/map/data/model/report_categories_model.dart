import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_categories_model.freezed.dart';
part 'report_categories_model.g.dart';

@freezed
abstract class ReportCategoriesModel with _$ReportCategoriesModel {
  const factory ReportCategoriesModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<ReportCategoriesDataModel>? data,
  }) = _ReportCategoriesModel;

  factory ReportCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$ReportCategoriesModelFromJson(json);
}

@freezed
abstract class ReportCategoriesDataModel with _$ReportCategoriesDataModel {
  const factory ReportCategoriesDataModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _ReportCategoriesDataModel;

  factory ReportCategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReportCategoriesDataModelFromJson(json);
}
