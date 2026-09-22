import 'package:freezed_annotation/freezed_annotation.dart';

part 'nearby_reports_model.freezed.dart';
part 'nearby_reports_model.g.dart';

@freezed
abstract class NearbyReportsModel with _$NearbyReportsModel {
  const factory NearbyReportsModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<NearbyReportsDataModel>? data,
  }) = _NearbyReportsModel;

  factory NearbyReportsModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyReportsModelFromJson(json);
}

@freezed
abstract class NearbyReportsDataModel with _$NearbyReportsDataModel {
  const factory NearbyReportsDataModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "category") NearbyReportsCategoryModel? category,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "photo_urls") List<String>? photoUrls,
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _NearbyReportsDataModel;

  factory NearbyReportsDataModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyReportsDataModelFromJson(json);
}

@freezed
abstract class NearbyReportsCategoryModel with _$NearbyReportsCategoryModel {
  const factory NearbyReportsCategoryModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _NearbyReportsCategoryModel;

  factory NearbyReportsCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyReportsCategoryModelFromJson(json);
}
