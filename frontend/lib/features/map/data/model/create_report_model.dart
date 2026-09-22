import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_report_model.freezed.dart';
part 'create_report_model.g.dart';

@freezed
abstract class CreateReportModel with _$CreateReportModel {
  const factory CreateReportModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") CreateReportDataModel? data,
  }) = _CreateReportModel;

  factory CreateReportModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReportModelFromJson(json);
}

@freezed
abstract class CreateReportDataModel with _$CreateReportDataModel {
  const factory CreateReportDataModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "category") CreateReportCategoryModel? category,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "photo_urls") List<String>? photoUrls,
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _CreateReportDataModel;

  factory CreateReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReportDataModelFromJson(json);
}

@freezed
abstract class CreateReportCategoryModel with _$CreateReportCategoryModel {
  const factory CreateReportCategoryModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _CreateReportCategoryModel;

  factory CreateReportCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReportCategoryModelFromJson(json);
}
