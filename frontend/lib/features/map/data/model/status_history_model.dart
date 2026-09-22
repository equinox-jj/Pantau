import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_history_model.freezed.dart';
part 'status_history_model.g.dart';

@freezed
abstract class StatusHistoryModel with _$StatusHistoryModel {
  const factory StatusHistoryModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<StatusHistoryEntryModel>? data,
  }) = _StatusHistoryModel;

  factory StatusHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$StatusHistoryModelFromJson(json);
}

@freezed
abstract class StatusHistoryEntryModel with _$StatusHistoryEntryModel {
  const factory StatusHistoryEntryModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "from_status") String? fromStatus,
    @JsonKey(name: "to_status") String? toStatus,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "actor_role") String? actorRole,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _StatusHistoryEntryModel;

  factory StatusHistoryEntryModel.fromJson(Map<String, dynamic> json) =>
      _$StatusHistoryEntryModelFromJson(json);
}
