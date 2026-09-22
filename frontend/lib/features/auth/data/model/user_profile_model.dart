import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
abstract class UserProfileModel with _$UserProfileModel {
  factory UserProfileModel({
    @JsonKey(name: "status") bool? status,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") UserProfileDataModel? data,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

@freezed
abstract class UserProfileDataModel with _$UserProfileDataModel {
  const factory UserProfileDataModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "display_name") String? displayName,
    @JsonKey(name: "joined_at") dynamic joinedAt,
    @JsonKey(name: "reports_count") int? reportsCount,
    @JsonKey(name: "resolved_count") int? resolvedCount,
  }) = _UserProfileDataModel;

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataModelFromJson(json);
}
