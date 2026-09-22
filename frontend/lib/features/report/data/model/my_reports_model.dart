import 'package:freezed_annotation/freezed_annotation.dart';

import 'feed_reports_model.dart';

part 'my_reports_model.freezed.dart';
part 'my_reports_model.g.dart';

/// `GET /reports/mine`.
///
/// Unlike the nearby read, this one pages: its rows sit under `data.items`
/// beside the counts, rather than being `data` itself.
@freezed
abstract class MyReportsModel with _$MyReportsModel {
  const factory MyReportsModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") MyReportsDataModel? data,
  }) = _MyReportsModel;

  factory MyReportsModel.fromJson(Map<String, dynamic> json) =>
      _$MyReportsModelFromJson(json);
}

@freezed
abstract class MyReportsDataModel with _$MyReportsDataModel {
  const factory MyReportsDataModel({
    @JsonKey(name: "items") List<FeedReportsDataModel>? items,
    @JsonKey(name: "meta") MyReportsMetaModel? meta,
  }) = _MyReportsDataModel;

  factory MyReportsDataModel.fromJson(Map<String, dynamic> json) =>
      _$MyReportsDataModelFromJson(json);
}

/// The window the rows were taken from. Parsed to keep the model faithful to
/// the payload; the feed scrolls one page rather than paging through them.
@freezed
abstract class MyReportsMetaModel with _$MyReportsMetaModel {
  const factory MyReportsMetaModel({
    @JsonKey(name: "limit") int? limit,
    @JsonKey(name: "offset") int? offset,
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "has_next") bool? hasNext,
  }) = _MyReportsMetaModel;

  factory MyReportsMetaModel.fromJson(Map<String, dynamic> json) =>
      _$MyReportsMetaModelFromJson(json);
}
