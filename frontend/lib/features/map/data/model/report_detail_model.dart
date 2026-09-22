import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_detail_model.freezed.dart';
part 'report_detail_model.g.dart';

@freezed
abstract class ReportDetailModel with _$ReportDetailModel {
  const factory ReportDetailModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") ReportDetailDataModel? data,
  }) = _ReportDetailModel;

  factory ReportDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailModelFromJson(json);
}

@freezed
abstract class ReportDetailDataModel with _$ReportDetailDataModel {
  const factory ReportDetailDataModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "category") ReportDetailCategoryModel? category,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "photo_urls") List<String>? photoUrls,
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _ReportDetailDataModel;

  factory ReportDetailDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailDataModelFromJson(json);
}

@freezed
abstract class ReportDetailCategoryModel with _$ReportDetailCategoryModel {
  const factory ReportDetailCategoryModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _ReportDetailCategoryModel;

  factory ReportDetailCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ReportDetailCategoryModelFromJson(json);
}
