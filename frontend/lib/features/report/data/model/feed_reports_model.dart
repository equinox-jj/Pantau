import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_reports_model.freezed.dart';
part 'feed_reports_model.g.dart';

@freezed
abstract class FeedReportsModel with _$FeedReportsModel {
  const factory FeedReportsModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<FeedReportsDataModel>? data,
  }) = _FeedReportsModel;

  factory FeedReportsModel.fromJson(Map<String, dynamic> json) =>
      _$FeedReportsModelFromJson(json);
}

/// One report row, shared by `GET /reports/nearby` and `GET /reports/mine`.
/// The latter carries a couple of fields more; the extras are ignored.
///
/// `photo_urls` and `description` are optional on purpose: the marker
/// contract does not promise them, so a payload without them still parses
/// and the card falls back to its no-photo state.
@freezed
abstract class FeedReportsDataModel with _$FeedReportsDataModel {
  const factory FeedReportsDataModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "category") FeedReportsCategoryModel? category,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "photo_urls") List<String>? photoUrls,
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _FeedReportsDataModel;

  factory FeedReportsDataModel.fromJson(Map<String, dynamic> json) =>
      _$FeedReportsDataModelFromJson(json);
}

@freezed
abstract class FeedReportsCategoryModel with _$FeedReportsCategoryModel {
  const factory FeedReportsCategoryModel({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "is_active") bool? isActive,
  }) = _FeedReportsCategoryModel;

  factory FeedReportsCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$FeedReportsCategoryModelFromJson(json);
}
