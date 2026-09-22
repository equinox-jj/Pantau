import 'package:freezed_annotation/freezed_annotation.dart';

part 'resolver_model.freezed.dart';
part 'resolver_model.g.dart';

/// `GET /queue`.
@freezed
abstract class QueueModel with _$QueueModel {
  const factory QueueModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") QueueDataModel? data,
  }) = _QueueModel;

  factory QueueModel.fromJson(Map<String, dynamic> json) =>
      _$QueueModelFromJson(json);
}

@freezed
abstract class QueueDataModel with _$QueueDataModel {
  const factory QueueDataModel({
    @JsonKey(name: "items") List<QueueReportDataModel>? items,
    @JsonKey(name: "meta") QueueMetaModel? meta,
    @JsonKey(name: "counts") QueueCountsModel? counts,
  }) = _QueueDataModel;

  factory QueueDataModel.fromJson(Map<String, dynamic> json) =>
      _$QueueDataModelFromJson(json);
}

/// One report row.
///
/// `photo_urls` and `description` are optional on purpose: a payload without
/// them still parses and the card falls back to its no-photo state, same as
/// the citizen feed's row model.
@freezed
abstract class QueueReportDataModel with _$QueueReportDataModel {
  const factory QueueReportDataModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "category") QueueCategoryModel? category,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "photo_urls") List<String>? photoUrls,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
    @JsonKey(name: "distance_meter") double? distanceMeter,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _QueueReportDataModel;

  factory QueueReportDataModel.fromJson(Map<String, dynamic> json) =>
      _$QueueReportDataModelFromJson(json);
}

@freezed
abstract class QueueCategoryModel with _$QueueCategoryModel {
  const factory QueueCategoryModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _QueueCategoryModel;

  factory QueueCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$QueueCategoryModelFromJson(json);
}

/// The window the rows were taken from, same shape as `MyReportsMetaModel`.
@freezed
abstract class QueueMetaModel with _$QueueMetaModel {
  const factory QueueMetaModel({
    @JsonKey(name: "limit") int? limit,
    @JsonKey(name: "offset") int? offset,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "has_next") bool? hasNext,
  }) = _QueueMetaModel;

  factory QueueMetaModel.fromJson(Map<String, dynamic> json) =>
      _$QueueMetaModelFromJson(json);
}

@freezed
abstract class QueueCountsModel with _$QueueCountsModel {
  const factory QueueCountsModel({
    @JsonKey(name: "open") int? open,
    @JsonKey(name: "in_progress") int? inProgress,
    @JsonKey(name: "resolved") int? resolved,
  }) = _QueueCountsModel;

  factory QueueCountsModel.fromJson(Map<String, dynamic> json) =>
      _$QueueCountsModelFromJson(json);
}
