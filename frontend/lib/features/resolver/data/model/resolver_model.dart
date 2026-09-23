import 'package:freezed_annotation/freezed_annotation.dart';

part 'resolver_model.freezed.dart';
part 'resolver_model.g.dart';

/// Payload of `GET /queue`; pagination is in the shared response envelope.
@freezed
abstract class QueueModel with _$QueueModel {
  const factory QueueModel({
    @JsonKey(name: "items") List<QueueReportDataModel>? items,
    @JsonKey(name: "counts") QueueCountsModel? counts,
  }) = _QueueModel;

  factory QueueModel.fromJson(Map<String, dynamic> json) =>
      _$QueueModelFromJson(json);
}

/// One report row.
///
/// `photo_url` and `description` are optional on purpose: a payload without
/// them still parses and the card falls back to its no-photo state, same as
/// the citizen feed's row model.
@freezed
abstract class QueueReportDataModel with _$QueueReportDataModel {
  const factory QueueReportDataModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "category") QueueCategoryModel? category,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "photo_url") String? photoUrl,
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
